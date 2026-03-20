# otelcol-receiver-tags-demo

Demonstrates the `tags:` config block on OpenTelemetry Collector receivers,
implemented in [cjksplunk/opentelemetry-collector@settable-context-via-tags](https://github.com/cjksplunk/opentelemetry-collector/tree/settable-context-via-tags).

The `tags:` block lets you stamp arbitrary key/value pairs as resource attributes
on every telemetry item a receiver produces — without modifying the receiver itself.

## What's wired up

| Receiver | Signal | What it monitors |
|---|---|---|
| `hostmetrics` | Metrics | CPU + memory of the local host |
| `filelog` | Logs | `./demo.log` in the current directory |
| `statsd` | Metrics | UDP port 8125 |

All three pipelines fan into the `debug` exporter (verbosity: detailed) so you
can see the injected resource attributes printed to stdout.

## Prerequisites

- Go 1.22+
- Internet access (to fetch the branch dependency and contrib receivers)

## Run

```bash
# Create a dummy log file for the filelog receiver to tail
touch demo.log

# Fetch dependencies (first run only)
go mod tidy

# Run the collector
go run . --config config.yaml
```

You should see output like:

```
ResourceMetrics #0
Resource SchemaURL:
Resource attributes:
     -> env: Str(dev)
     -> host.role: Str(collector-demo)
     -> team: Str(platform)
     -> host.name: Str(your-hostname)
...
```

The `env`, `host.role`, and `team` attributes come from the `tags:` block in
`config.yaml`. The `host.name` attribute is emitted by the hostmetrics receiver
itself — both coexist on the same resource.

## Sending a test StatsD metric

```bash
echo "demo.counter:1|c" | nc -u -w1 localhost 8125
```

## Dependency pinning

`go.mod` uses `replace` directives to pin all `go.opentelemetry.io/collector/*`
modules to commit `25a7d7f016a0133ee6a4b87e8089b91a094f559b` on the
`settable-context-via-tags` branch of the fork. Anyone with `go` installed can
reproduce this build exactly with `go mod tidy && go build .`.

To update to a newer commit on the branch, replace the pseudo-version
`v0.0.0-20260320102225-25a7d7f016a0` in all `replace` lines in `go.mod` with
the new one (generate via `go list -m -json github.com/cjksplunk/opentelemetry-collector@<sha>`).
