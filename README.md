# otelcol-receiver-tags-demo

Demonstrates the `tags:` config block on OpenTelemetry Collector receivers,
implemented in [cjksplunk/opentelemetry-collector@settable-context-via-tags](https://github.com/cjksplunk/opentelemetry-collector/tree/settable-context-via-tags).

The `tags:` block injects arbitrary key/value pairs into the context that
travels with every telemetry item. Downstream processors can then consume those
values via `from_context: tags.<key>` — without modifying the receiver itself.

## What's wired up

Three `otlp` receiver instances (prod-us-east on `:4317`/`:4318`, staging-eu-west
on `:4327`/`:4328`, dev-local on `:4337`/`:4338`), each with distinct `tags:` values
for `connection_name`, `instance`, and `owner`.

- `resource` processor — promotes two tags to resource attributes under new names:
  `connection_name` → `region`, `instance` → `service.name`
- `attributes` processor — independently reads the same two tags and writes them
  as log attributes under different names: `connection_name` → `source.id`,
  `instance` → `collector.node`
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

With the collector running, use `make` to send synthetic OTLP logs:

```bash
make send-logs      # send logs to prod-us-east (:4317) for 5s
make send-logs-all  # send logs to all three receiver instances
```

You should see attributes injected by the tags in the debug output:

```
Resource attributes:
     -> region: Str(prod-us-east)
     -> service.name: Str(collector-1)
...
     -> source.id: Str(prod-us-east)
     -> collector.node: Str(collector-1)
```

## Dependency pinning

`go.mod` uses `replace` directives to pin all `go.opentelemetry.io/collector/*`
modules to commit `372cc483b303` on the `settable-context-via-tags` branch of
the fork. Anyone with `go` installed can reproduce this build exactly with
`go mod tidy && go build .`.

To update to a newer commit on the branch, replace the pseudo-version timestamp
and SHA in all `replace` lines in `go.mod` with the new one (generate via
`go list -m -json github.com/cjksplunk/opentelemetry-collector@<sha>`).
