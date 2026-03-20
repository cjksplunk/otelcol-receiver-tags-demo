# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this is

A minimal custom OpenTelemetry Collector binary that demonstrates the `tags:` config block on receivers — a feature from the `settable-context-via-tags` branch of a forked collector core. The `tags:` map stamps arbitrary key/value pairs as resource attributes on every telemetry item a receiver produces, without modifying the receiver itself.

## Commands

```bash
# First-time setup
touch demo.log          # required for the filelog receiver
go mod tidy             # fetch pinned fork dependencies

# Run the collector
go run . --config config.yaml

# Build
go build .

# Send a test StatsD metric
echo "demo.counter:1|c" | nc -u -w1 localhost 8125
```

There are no tests in this repository.

## Architecture

The entire program is `main.go`. It follows the standard custom collector pattern:

- `components()` registers factories for all receivers, exporters, and telemetry — only `otlpreceiver`, `nopreceiver`, and `debugexporter` are wired in.
- `main()` constructs `otelcol.CollectorSettings` with those factories and three config providers (env, file, yaml), then delegates to `otelcol.NewCommand`.
- `config.yaml` defines the pipelines and is where `tags:` blocks live on each receiver.

## Dependency pinning

All `go.opentelemetry.io/collector/*` modules are `replace`-directed in `go.mod` to the fork `github.com/cjksplunk/opentelemetry-collector` at commit `25a7d7f016a0` (branch `settable-context-via-tags`). Normal `go get` against upstream won't work. To update to a newer commit on the branch, replace the pseudo-version in every `replace` line — generate a new one with:

```bash
go list -m -json github.com/cjksplunk/opentelemetry-collector@<sha>
```

## Adding receivers or exporters

1. Add the factory package to `go.mod` (may need a `replace` directive pointing to the fork if it's a core component).
2. Register the factory in `components()` inside `main.go`.
3. Add the receiver/exporter config (including a `tags:` block if desired) to `config.yaml` and wire it into a pipeline under `service.pipelines`.
