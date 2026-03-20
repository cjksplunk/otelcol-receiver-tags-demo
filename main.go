// Command otelcol-receiver-tags-demo runs a minimal OpenTelemetry Collector
// that demonstrates the `tags:` config block on receivers. Each receiver in
// config.yaml carries a `tags:` map; the collector injects those key/value
// pairs into context.Context as client.Info.Metadata under a "tags." prefix.
// A resourceprocessor then promotes them to resource attributes via
// `from_context: tags.<key>` actions.
//
// Receivers wired up:
//   - otlp  (logs + metrics + traces — OTLP gRPC :4317 / HTTP :4318)
//
// All pipelines run through the resource processor then fan into the debug
// exporter (verbosity: detailed) so you can see the injected resource
// attributes printed to stdout.
package main

import (
	"log"
	"os"

	"github.com/open-telemetry/opentelemetry-collector-contrib/processor/attributesprocessor"
	"github.com/open-telemetry/opentelemetry-collector-contrib/processor/resourceprocessor"
	"go.opentelemetry.io/collector/component"
	"go.opentelemetry.io/collector/confmap"
	envprovider "go.opentelemetry.io/collector/confmap/provider/envprovider"
	fileprovider "go.opentelemetry.io/collector/confmap/provider/fileprovider"
	yamlprovider "go.opentelemetry.io/collector/confmap/provider/yamlprovider"
	"go.opentelemetry.io/collector/exporter/debugexporter"
	"go.opentelemetry.io/collector/otelcol"
	"go.opentelemetry.io/collector/processor"
	"go.opentelemetry.io/collector/receiver"
	otelconftelemetry "go.opentelemetry.io/collector/service/telemetry/otelconftelemetry"
	"go.opentelemetry.io/collector/receiver/otlpreceiver"
)

func main() {
	info := component.BuildInfo{
		Command:     "otelcol-receiver-tags-demo",
		Description: "Demo collector showing receiver tags feature",
		Version:     "0.0.1",
	}

	set := otelcol.CollectorSettings{
		BuildInfo: info,
		Factories: components,
		ConfigProviderSettings: otelcol.ConfigProviderSettings{
			ResolverSettings: confmap.ResolverSettings{
				ProviderFactories: []confmap.ProviderFactory{
					envprovider.NewFactory(),
					fileprovider.NewFactory(),
					yamlprovider.NewFactory(),
				},
				DefaultScheme: "file",
			},
		},
	}

	cmd := otelcol.NewCommand(set)
	if err := cmd.Execute(); err != nil {
		log.Printf("collector error: %v", err)
		os.Exit(1)
	}
}

func components() (otelcol.Factories, error) {
	var f otelcol.Factories
	var err error

	f.Receivers, err = otelcol.MakeFactoryMap[receiver.Factory](
		otlpreceiver.NewFactory(),
	)
	if err != nil {
		return f, err
	}

	f.Processors, err = otelcol.MakeFactoryMap[processor.Factory](
		attributesprocessor.NewFactory(),
		resourceprocessor.NewFactory(),
	)
	if err != nil {
		return f, err
	}

	f.Exporters, err = otelcol.MakeFactoryMap(
		debugexporter.NewFactory(),
	)
	if err != nil {
		return f, err
	}

	f.Telemetry = otelconftelemetry.NewFactory()
	return f, nil
}
