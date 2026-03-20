OTLP_ENDPOINT ?= localhost:4317
DURATION      ?= 5s

.PHONY: send-traces send-metrics send-logs send-all

send-traces:
	telemetrygen traces --otlp-insecure --otlp-endpoint $(OTLP_ENDPOINT) --duration $(DURATION)

send-metrics:
	telemetrygen metrics --otlp-insecure --otlp-endpoint $(OTLP_ENDPOINT) --duration $(DURATION)

send-logs:
	telemetrygen logs --otlp-insecure --otlp-endpoint $(OTLP_ENDPOINT) --duration $(DURATION)

send-all: send-traces send-metrics send-logs
