# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this is

A minimal custom OpenTelemetry Collector binary that demonstrates the `tags:` config block on receivers — a feature from the `settable-context-via-tags` branch of a forked collector core. The `tags:` map injects arbitrary key/value pairs into `context.Context` (via `client.Info.Metadata` under a `tags.` prefix) on every telemetry item a receiver produces, without modifying the receiver itself. Downstream processors then promote those values to resource or data-point attributes via `from_context: tags.<key>`.

## Commands

```bash
# First-time setup (GONOSUMDB required — the fork is not in the public checksum database)
GONOSUMDB="github.com/cjksplunk/*" go mod tidy

# Run the collector
GONOSUMDB="github.com/cjksplunk/*" go run . --config config.yaml

# Build
GONOSUMDB="github.com/cjksplunk/*" go build .

# Send test logs (collector must be running)
make send-logs          # logs to prod-us-east (:4317) for 5s
make send-logs-all      # logs to all three receiver instances
```

There are no tests in this repository.

## Running tests in the fork

Each module in the fork (`/Users/ckalbrener/git/opentelemetry-collector`) has its own `go.mod`. Run tests per-module:

```bash
cd /Users/ckalbrener/git/opentelemetry-collector/consumer/tagsconsumer && go test ./... -cover
cd /Users/ckalbrener/git/opentelemetry-collector/service && go test ./... -cover
cd /Users/ckalbrener/git/opentelemetry-collector/otelcol && go mod tidy && go test ./... -cover
```

Note: `otelcol/go.mod` frequently needs `go mod tidy` before tests will run — without it `go test` fails with "updates to go.mod needed".

## Architecture

The entire program is `main.go`. It follows the standard custom collector pattern:

- `components()` registers factories for: `otlpreceiver`, `attributesprocessor`, `resourceprocessor`, and `debugexporter`.
- `main()` constructs `otelcol.CollectorSettings` with those factories and three config providers (env, file, yaml), then delegates to `otelcol.NewCommand`.
- `config.yaml` defines three `otlp/*` receiver instances each with a `tags:` block, two processors that independently consume the same context tags under different attribute names, and a logs-only pipeline.

The key flow: `tags:` on a receiver → `tagsconsumer` shim injects into `client.Info.Metadata` → `resourceprocessor`/`attributesprocessor` read via `from_context: tags.<key>` → attributes appear in debug output.

## Dependency pinning

All `go.opentelemetry.io/collector/*` modules are `replace`-directed in `go.mod` to tagged versions on the fork `github.com/cjksplunk/opentelemetry-collector` (e.g. `service/v0.148.1`, `consumer/v1.54.1`). Contrib processors (`attributesprocessor`, `resourceprocessor`) have no fork-specific changes and resolve from upstream at `v0.148.0`.

Because the fork is not in the public Go checksum database, `GONOSUMDB="github.com/cjksplunk/*"` must be set for any `go` command that downloads dependencies.

To update to a newer commit on the branch:
1. Create new patch tags for all sub-modules at the new HEAD in the fork
2. Update the version strings in the `replace` block in `go.mod`
3. Run `GONOSUMDB="github.com/cjksplunk/*" go mod tidy`

## Adding receivers or exporters

1. Add the factory package to `go.mod`. If it's a core component, add a local-path `replace` directive pointing into `/Users/ckalbrener/git/opentelemetry-collector`. If it's a contrib component, point to `/Users/ckalbrener/git/cjksplunk-opentelemetry-collector-contrib`.
2. Register the factory in `components()` inside `main.go`.
3. Add the receiver/exporter config (including a `tags:` block if desired) to `config.yaml` and wire it into a pipeline under `service.pipelines`.
