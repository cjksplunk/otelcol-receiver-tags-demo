DURATION ?= 5s

.PHONY: send-logs send-logs-all

send-logs:
	telemetrygen logs --otlp-insecure --otlp-endpoint localhost:4317 --duration $(DURATION)

send-logs-all:
	telemetrygen logs --otlp-insecure --otlp-endpoint localhost:4317 --duration $(DURATION)
	telemetrygen logs --otlp-insecure --otlp-endpoint localhost:4327 --duration $(DURATION)
	telemetrygen logs --otlp-insecure --otlp-endpoint localhost:4337 --duration $(DURATION)
