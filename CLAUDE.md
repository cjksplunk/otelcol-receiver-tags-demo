# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this is

A minimal custom OpenTelemetry Collector binary that demonstrates the `tags:` config block on receivers — a feature from the `settable-context-via-tags` branch of a forked collector core. The `tags:` map injects arbitrary key/value pairs into `context.Context` (via `client.Info.Metadata` under a `tags.` prefix) on every telemetry item a receiver produces, without modifying the receiver itself. Downstream processors then promote those values to resource or data-point attributes via `from_context: tags.<key>`.

## Commands

```bash
# First-time setup
go mod tidy             # fetch pinned fork dependencies

# Run the collector
go run . --config config.yaml

# Build
go build .

# Send test logs (collector must be running)
make send-logs          # logs to prod-us-east (:4317) for 5s
make send-logs-all      # logs to all three receiver instances
```

There are no tests in this repository.

## Architecture

The entire program is `main.go`. It follows the standard custom collector pattern:

- `components()` registers factories for: `otlpreceiver`, `attributesprocessor`, `resourceprocessor`, and `debugexporter`.
- `main()` constructs `otelcol.CollectorSettings` with those factories and three config providers (env, file, yaml), then delegates to `otelcol.NewCommand`.
- `config.yaml` defines three `otlp/*` receiver instances each with a `tags:` block, two processors that independently consume the same context tags under different attribute names, and a logs-only pipeline.

The key flow: `tags:` on a receiver → `tagsconsumer` shim injects into `client.Info.Metadata` → `resourceprocessor`/`attributesprocessor` read via `from_context: tags.<key>` → attributes appear in debug output.

## Dependency pinning

All `go.opentelemetry.io/collector/*` modules and contrib processors are currently `replace`-directed in `go.mod` to **local filesystem paths**:

- Core: `/Users/ckalbrener/git/opentelemetry-collector/...`
- Contrib: `/Users/ckalbrener/git/cjksplunk-opentelemetry-collector-contrib/...`

This bypasses the module cache entirely and picks up local changes immediately. To switch to a published remote commit instead, replace each local path `replace` with a remote pseudo-version pointing to `github.com/cjksplunk/opentelemetry-collector@<sha>` — generate the pseudo-version with:

```bash
go list -m -json github.com/cjksplunk/opentelemetry-collector@<sha>
```

## Adding receivers or exporters

1. Add the factory package to `go.mod`. If it's a core component, add a local-path `replace` directive pointing into `/Users/ckalbrener/git/opentelemetry-collector`. If it's a contrib component, point to `/Users/ckalbrener/git/cjksplunk-opentelemetry-collector-contrib`.
2. Register the factory in `components()` inside `main.go`.
3. Add the receiver/exporter config (including a `tags:` block if desired) to `config.yaml` and wire it into a pipeline under `service.pipelines`.
