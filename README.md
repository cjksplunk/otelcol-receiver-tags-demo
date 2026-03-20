# otelcol-receiver-tags-demo

## What this proves

Today, operators who want to stamp a resource attribute on all telemetry from a
specific receiver — say, to identify which connection or environment it came from
— must either fork the receiver or insert a static-value processor that has no
way of knowing *which* receiver instance produced the data. Neither option scales
when you have many receiver instances with different identities.

This repo demonstrates a solution that requires **zero changes to any receiver or
contrib component**: a `tags:` config block added to the collector core that lets
operators attach arbitrary key/value pairs directly to a receiver's configuration.
The feature works with every existing receiver, today, without touching contrib.

### How it works

1. **Core change only** — the `tags:` block is parsed by the collector's config
   unmarshaler ([`configunmarshaler`](https://github.com/cjksplunk/opentelemetry-collector/tree/settable-context-via-tags/otelcol/internal/configunmarshaler))
   before the receiver factory ever sees the config. The receiver never knows
   the block existed.

2. **Context injection** — each receiver is wrapped by a thin
   [`tagsconsumer`](https://github.com/cjksplunk/opentelemetry-collector/tree/settable-context-via-tags/consumer/tagsconsumer)
   shim. When the receiver calls `ConsumeTraces`/`ConsumeLogs`/`ConsumeMetrics`,
   the shim calls `client.Info.Metadata` to store the tags under a `tags.` prefix
   in the request context before passing data downstream. The receiver's own logic
   is untouched.

3. **Processor consumption** — any processor that already supports `from_context`
   (e.g. `resourceprocessor`, `attributesprocessor`) can read those values out of
   the context and write them as resource or data-point attributes under whatever
   name the operator chooses. No new processor needed.

The result: a single config file can express per-receiver identity without any
code changes outside collector core.

---

Implemented in [cjksplunk/opentelemetry-collector@settable-context-via-tags](https://github.com/cjksplunk/opentelemetry-collector/tree/settable-context-via-tags).

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

The collector core is pinned to a fork that is not in the public Go checksum database,
so `GONOSUMDB` is required for any `go` command that downloads dependencies.

```bash
# Fetch dependencies (first run only)
GONOSUMDB="github.com/cjksplunk/*" go mod tidy

# Run the collector
GONOSUMDB="github.com/cjksplunk/*" go run . --config config.yaml
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
