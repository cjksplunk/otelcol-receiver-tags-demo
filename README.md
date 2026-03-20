# otelcol-receiver-tags-demo

Demonstrates the `tags:` config block on OpenTelemetry Collector receivers,
implemented in [cjksplunk/opentelemetry-collector@settable-context-via-tags](https://github.com/cjksplunk/opentelemetry-collector/tree/settable-context-via-tags).

The `tags:` block injects arbitrary key/value pairs into the context that
travels with every telemetry item. A `resourceprocessor` downstream then
promotes them to resource attributes via `from_context: tags.<key>` — without
modifying the receiver itself.

## What's wired up

- `otlp` receiver — accepts traces, metrics, and logs via gRPC `:4317` / HTTP `:4318`
- `resource` processor — promotes tags from context to resource attributes
- `debug` exporter — prints full telemetry detail to stdout

## Prerequisites

- Go 1.22+
- [`telemetrygen`](https://github.com/open-telemetry/opentelemetry-collector-contrib/tree/main/cmd/telemetrygen) for sending test data:

```bash
go install github.com/open-telemetry/opentelemetry-collector-contrib/cmd/telemetrygen@latest
```

## Run

```bash
# Fetch dependencies (first run only)
go mod tidy

# Run the collector
go run . --config config.yaml
```

## Sending test data

With the collector running, use `make` to send synthetic OTLP data:

```bash
make send-traces    # send traces for 5s
make send-metrics   # send metrics for 5s
make send-logs      # send logs for 5s
make send-all       # send all three signals
```

You should see resource attributes injected by the tags in the debug output:

```
Resource attributes:
     -> env: Str(dev)
     -> team: Str(platform)
     -> receiver.type: Str(otlp)
```

## Dependency pinning

`go.mod` uses `replace` directives to pin all `go.opentelemetry.io/collector/*`
modules to commit `372cc483b303` on the `settable-context-via-tags` branch of
the fork. Anyone with `go` installed can reproduce this build exactly with
`go mod tidy && go build .`.

To update to a newer commit on the branch, replace the pseudo-version timestamp
and SHA in all `replace` lines in `go.mod` with the new one (generate via
`go list -m -json github.com/cjksplunk/opentelemetry-collector@<sha>`).
