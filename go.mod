module github.com/cjksplunk/otelcol-receiver-tags-demo

go 1.25.0

require (
	github.com/open-telemetry/opentelemetry-collector-contrib/processor/attributesprocessor v0.148.0
	github.com/open-telemetry/opentelemetry-collector-contrib/processor/resourceprocessor v0.148.0
	go.opentelemetry.io/collector/component v1.54.1-0.20260320051400-372cc483b303
	go.opentelemetry.io/collector/confmap v1.54.1-0.20260320051400-372cc483b303
	go.opentelemetry.io/collector/confmap/provider/envprovider v0.0.0-00010101000000-000000000000
	go.opentelemetry.io/collector/confmap/provider/fileprovider v1.54.0
	go.opentelemetry.io/collector/confmap/provider/yamlprovider v0.0.0-00010101000000-000000000000
	go.opentelemetry.io/collector/exporter/debugexporter v0.148.0
	go.opentelemetry.io/collector/otelcol v0.148.0
	go.opentelemetry.io/collector/processor v1.54.1-0.20260320051400-372cc483b303
	go.opentelemetry.io/collector/receiver v1.54.1-0.20260320051400-372cc483b303
	go.opentelemetry.io/collector/receiver/otlpreceiver v0.148.0
	go.opentelemetry.io/collector/service v0.148.0
)

require (
	github.com/alecthomas/participle/v2 v2.1.4 // indirect
	github.com/antchfx/xmlquery v1.5.0 // indirect
	github.com/antchfx/xpath v1.3.6 // indirect
	github.com/beorn7/perks v1.0.1 // indirect
	github.com/cenkalti/backoff/v5 v5.0.3 // indirect
	github.com/cespare/xxhash/v2 v2.3.0 // indirect
	github.com/davecgh/go-spew v1.1.2-0.20180830191138-d8f796af33cc // indirect
	github.com/ebitengine/purego v0.10.0 // indirect
	github.com/elastic/go-grok v0.3.1 // indirect
	github.com/elastic/lunes v0.2.0 // indirect
	github.com/expr-lang/expr v1.17.8 // indirect
	github.com/felixge/httpsnoop v1.0.4 // indirect
	github.com/foxboron/go-tpm-keyfiles v0.0.0-20251226215517-609e4778396f // indirect
	github.com/fsnotify/fsnotify v1.9.0 // indirect
	github.com/go-logr/logr v1.4.3 // indirect
	github.com/go-logr/stdr v1.2.2 // indirect
	github.com/go-ole/go-ole v1.3.0 // indirect
	github.com/go-viper/mapstructure/v2 v2.5.0 // indirect
	github.com/gobwas/glob v0.2.3 // indirect
	github.com/goccy/go-json v0.10.5 // indirect
	github.com/golang/groupcache v0.0.0-20241129210726-2c02b8208cf8 // indirect
	github.com/golang/snappy v1.0.0 // indirect
	github.com/google/go-tpm v0.9.8 // indirect
	github.com/google/uuid v1.6.0 // indirect
	github.com/grpc-ecosystem/grpc-gateway/v2 v2.28.0 // indirect
	github.com/hashicorp/go-version v1.8.0 // indirect
	github.com/hashicorp/golang-lru v1.0.2 // indirect
	github.com/hashicorp/golang-lru/v2 v2.0.7 // indirect
	github.com/iancoleman/strcase v0.3.0 // indirect
	github.com/inconshreveable/mousetrap v1.1.0 // indirect
	github.com/json-iterator/go v1.1.12 // indirect
	github.com/klauspost/compress v1.18.4 // indirect
	github.com/klauspost/cpuid/v2 v2.3.0 // indirect
	github.com/knadh/koanf/maps v0.1.2 // indirect
	github.com/knadh/koanf/providers/confmap v1.0.0 // indirect
	github.com/knadh/koanf/v2 v2.3.3 // indirect
	github.com/lufia/plan9stats v0.0.0-20251013123823-9fd1530e3ec3 // indirect
	github.com/magefile/mage v1.15.0 // indirect
	github.com/mitchellh/copystructure v1.2.0 // indirect
	github.com/mitchellh/reflectwalk v1.0.2 // indirect
	github.com/modern-go/concurrent v0.0.0-20180306012644-bacd9c7ef1dd // indirect
	github.com/modern-go/reflect2 v1.0.3-0.20250322232337-35a7c28c31ee // indirect
	github.com/mostynb/go-grpc-compression v1.2.3 // indirect
	github.com/munnerz/goautoneg v0.0.0-20191010083416-a7dc8b61c822 // indirect
	github.com/open-telemetry/opentelemetry-collector-contrib/internal/coreinternal v0.148.0 // indirect
	github.com/open-telemetry/opentelemetry-collector-contrib/internal/filter v0.148.0 // indirect
	github.com/open-telemetry/opentelemetry-collector-contrib/pkg/ottl v0.148.0 // indirect
	github.com/open-telemetry/opentelemetry-collector-contrib/pkg/pdatautil v0.148.0 // indirect
	github.com/pierrec/lz4/v4 v4.1.26 // indirect
	github.com/pmezard/go-difflib v1.0.1-0.20181226105442-5d4384ee4fb2 // indirect
	github.com/power-devops/perfstat v0.0.0-20240221224432-82ca36839d55 // indirect
	github.com/prometheus/client_golang v1.23.2 // indirect
	github.com/prometheus/client_model v0.6.2 // indirect
	github.com/prometheus/common v0.67.5 // indirect
	github.com/prometheus/otlptranslator v1.0.0 // indirect
	github.com/prometheus/procfs v0.20.1 // indirect
	github.com/rs/cors v1.11.1 // indirect
	github.com/shirou/gopsutil/v4 v4.26.2 // indirect
	github.com/spf13/cobra v1.10.2 // indirect
	github.com/spf13/pflag v1.0.10 // indirect
	github.com/stretchr/testify v1.11.1 // indirect
	github.com/tklauser/go-sysconf v0.3.16 // indirect
	github.com/tklauser/numcpus v0.11.0 // indirect
	github.com/twmb/murmur3 v1.1.8 // indirect
	github.com/ua-parser/uap-go v0.0.0-20251207011819-db9adb27a0b8 // indirect
	github.com/yusufpapurcu/wmi v1.2.4 // indirect
	github.com/zeebo/xxh3 v1.1.0 // indirect
	go.opentelemetry.io/auto/sdk v1.2.1 // indirect
	go.opentelemetry.io/collector v0.148.0 // indirect
	go.opentelemetry.io/collector/client v1.54.1-0.20260320051400-372cc483b303 // indirect
	go.opentelemetry.io/collector/component/componentstatus v0.148.1-0.20260320051400-372cc483b303 // indirect
	go.opentelemetry.io/collector/component/componenttest v0.148.1-0.20260320051400-372cc483b303 // indirect
	go.opentelemetry.io/collector/config/configauth v1.54.0 // indirect
	go.opentelemetry.io/collector/config/configcompression v1.54.0 // indirect
	go.opentelemetry.io/collector/config/configgrpc v0.148.0 // indirect
	go.opentelemetry.io/collector/config/confighttp v0.148.0 // indirect
	go.opentelemetry.io/collector/config/configmiddleware v1.54.0 // indirect
	go.opentelemetry.io/collector/config/confignet v1.54.0 // indirect
	go.opentelemetry.io/collector/config/configopaque v1.54.0 // indirect
	go.opentelemetry.io/collector/config/configoptional v1.54.0 // indirect
	go.opentelemetry.io/collector/config/configretry v1.54.0 // indirect
	go.opentelemetry.io/collector/config/configtelemetry v0.148.0 // indirect
	go.opentelemetry.io/collector/config/configtls v1.54.0 // indirect
	go.opentelemetry.io/collector/confmap/xconfmap v0.148.1-0.20260320051400-372cc483b303 // indirect
	go.opentelemetry.io/collector/connector v0.148.0 // indirect
	go.opentelemetry.io/collector/connector/connectortest v0.148.0 // indirect
	go.opentelemetry.io/collector/connector/xconnector v0.148.0 // indirect
	go.opentelemetry.io/collector/consumer v1.54.1-0.20260320051400-372cc483b303 // indirect
	go.opentelemetry.io/collector/consumer/consumererror v0.148.1-0.20260320051400-372cc483b303 // indirect
	go.opentelemetry.io/collector/consumer/consumererror/xconsumererror v0.148.0 // indirect
	go.opentelemetry.io/collector/consumer/consumertest v0.148.1-0.20260320051400-372cc483b303 // indirect
	go.opentelemetry.io/collector/consumer/tagsconsumer v0.148.0 // indirect
	go.opentelemetry.io/collector/consumer/xconsumer v0.148.1-0.20260320051400-372cc483b303 // indirect
	go.opentelemetry.io/collector/exporter v1.54.0 // indirect
	go.opentelemetry.io/collector/exporter/exporterhelper v0.148.0 // indirect
	go.opentelemetry.io/collector/exporter/exporterhelper/xexporterhelper v0.148.0 // indirect
	go.opentelemetry.io/collector/exporter/exportertest v0.148.0 // indirect
	go.opentelemetry.io/collector/exporter/xexporter v0.148.0 // indirect
	go.opentelemetry.io/collector/extension v1.54.0 // indirect
	go.opentelemetry.io/collector/extension/extensionauth v1.54.0 // indirect
	go.opentelemetry.io/collector/extension/extensioncapabilities v0.148.0 // indirect
	go.opentelemetry.io/collector/extension/extensionmiddleware v0.148.0 // indirect
	go.opentelemetry.io/collector/extension/extensiontest v0.148.0 // indirect
	go.opentelemetry.io/collector/extension/xextension v0.148.0 // indirect
	go.opentelemetry.io/collector/featuregate v1.54.1-0.20260320051400-372cc483b303 // indirect
	go.opentelemetry.io/collector/internal/componentalias v0.148.1-0.20260320051400-372cc483b303 // indirect
	go.opentelemetry.io/collector/internal/fanoutconsumer v0.148.0 // indirect
	go.opentelemetry.io/collector/internal/sharedcomponent v0.148.0 // indirect
	go.opentelemetry.io/collector/internal/telemetry v0.148.0 // indirect
	go.opentelemetry.io/collector/pdata v1.54.1-0.20260320051400-372cc483b303 // indirect
	go.opentelemetry.io/collector/pdata/pprofile v0.148.1-0.20260320051400-372cc483b303 // indirect
	go.opentelemetry.io/collector/pdata/testdata v0.148.1-0.20260320051400-372cc483b303 // indirect
	go.opentelemetry.io/collector/pdata/xpdata v0.148.1-0.20260320051400-372cc483b303 // indirect
	go.opentelemetry.io/collector/pipeline v1.54.1-0.20260320051400-372cc483b303 // indirect
	go.opentelemetry.io/collector/pipeline/xpipeline v0.148.0 // indirect
	go.opentelemetry.io/collector/processor/processorhelper v0.148.1-0.20260320051400-372cc483b303 // indirect
	go.opentelemetry.io/collector/processor/processorhelper/xprocessorhelper v0.148.1-0.20260320051400-372cc483b303 // indirect
	go.opentelemetry.io/collector/processor/processortest v0.148.1-0.20260320051400-372cc483b303 // indirect
	go.opentelemetry.io/collector/processor/xprocessor v0.148.1-0.20260320051400-372cc483b303 // indirect
	go.opentelemetry.io/collector/receiver/receiverhelper v0.148.0 // indirect
	go.opentelemetry.io/collector/receiver/receivertest v0.148.1-0.20260320051400-372cc483b303 // indirect
	go.opentelemetry.io/collector/receiver/xreceiver v0.148.1-0.20260320051400-372cc483b303 // indirect
	go.opentelemetry.io/collector/service/hostcapabilities v0.148.0 // indirect
	go.opentelemetry.io/contrib/bridges/otelzap v0.17.0 // indirect
	go.opentelemetry.io/contrib/instrumentation/google.golang.org/grpc/otelgrpc v0.67.0 // indirect
	go.opentelemetry.io/contrib/instrumentation/net/http/otelhttp v0.67.0 // indirect
	go.opentelemetry.io/contrib/otelconf v0.22.0 // indirect
	go.opentelemetry.io/contrib/propagators/b3 v1.42.0 // indirect
	go.opentelemetry.io/otel v1.42.0 // indirect
	go.opentelemetry.io/otel/exporters/otlp/otlplog/otlploggrpc v0.18.0 // indirect
	go.opentelemetry.io/otel/exporters/otlp/otlplog/otlploghttp v0.18.0 // indirect
	go.opentelemetry.io/otel/exporters/otlp/otlpmetric/otlpmetricgrpc v1.42.0 // indirect
	go.opentelemetry.io/otel/exporters/otlp/otlpmetric/otlpmetrichttp v1.42.0 // indirect
	go.opentelemetry.io/otel/exporters/otlp/otlptrace v1.42.0 // indirect
	go.opentelemetry.io/otel/exporters/otlp/otlptrace/otlptracegrpc v1.42.0 // indirect
	go.opentelemetry.io/otel/exporters/otlp/otlptrace/otlptracehttp v1.42.0 // indirect
	go.opentelemetry.io/otel/exporters/prometheus v0.64.0 // indirect
	go.opentelemetry.io/otel/exporters/stdout/stdoutlog v0.18.0 // indirect
	go.opentelemetry.io/otel/exporters/stdout/stdoutmetric v1.42.0 // indirect
	go.opentelemetry.io/otel/exporters/stdout/stdouttrace v1.42.0 // indirect
	go.opentelemetry.io/otel/log v0.18.0 // indirect
	go.opentelemetry.io/otel/metric v1.42.0 // indirect
	go.opentelemetry.io/otel/sdk v1.42.0 // indirect
	go.opentelemetry.io/otel/sdk/log v0.18.0 // indirect
	go.opentelemetry.io/otel/sdk/metric v1.42.0 // indirect
	go.opentelemetry.io/otel/trace v1.42.0 // indirect
	go.opentelemetry.io/proto/otlp v1.10.0 // indirect
	go.uber.org/multierr v1.11.0 // indirect
	go.uber.org/zap v1.27.1 // indirect
	go.yaml.in/yaml/v2 v2.4.3 // indirect
	go.yaml.in/yaml/v3 v3.0.4 // indirect
	golang.org/x/crypto v0.48.0 // indirect
	golang.org/x/exp v0.0.0-20260218203240-3dfff04db8fa // indirect
	golang.org/x/net v0.51.0 // indirect
	golang.org/x/sys v0.42.0 // indirect
	golang.org/x/text v0.34.0 // indirect
	gonum.org/v1/gonum v0.17.0 // indirect
	google.golang.org/genproto/googleapis/api v0.0.0-20260226221140-a57be14db171 // indirect
	google.golang.org/genproto/googleapis/rpc v0.0.0-20260226221140-a57be14db171 // indirect
	google.golang.org/grpc v1.79.3 // indirect
	google.golang.org/protobuf v1.36.11 // indirect
	gopkg.in/yaml.v3 v3.0.1 // indirect
)

// Pin all go.opentelemetry.io/collector/* modules to the local settable-context-via-tags
// branch of github.com/cjksplunk/opentelemetry-collector. Local paths are used because
// the branch has not been fully pushed to the remote — the module cache would otherwise
// serve stale code.
//
// Pin contrib processors to the local fork which is built against the same collector source.
replace (
	github.com/open-telemetry/opentelemetry-collector-contrib/internal/coreinternal => /Users/ckalbrener/git/cjksplunk-opentelemetry-collector-contrib/internal/coreinternal
	github.com/open-telemetry/opentelemetry-collector-contrib/internal/filter => /Users/ckalbrener/git/cjksplunk-opentelemetry-collector-contrib/internal/filter
	github.com/open-telemetry/opentelemetry-collector-contrib/pkg/ottl => /Users/ckalbrener/git/cjksplunk-opentelemetry-collector-contrib/pkg/ottl
	github.com/open-telemetry/opentelemetry-collector-contrib/pkg/pdatatest => /Users/ckalbrener/git/cjksplunk-opentelemetry-collector-contrib/pkg/pdatatest
	github.com/open-telemetry/opentelemetry-collector-contrib/pkg/pdatautil => /Users/ckalbrener/git/cjksplunk-opentelemetry-collector-contrib/pkg/pdatautil
	github.com/open-telemetry/opentelemetry-collector-contrib/processor/attributesprocessor => /Users/ckalbrener/git/cjksplunk-opentelemetry-collector-contrib/processor/attributesprocessor
	github.com/open-telemetry/opentelemetry-collector-contrib/processor/resourceprocessor => /Users/ckalbrener/git/cjksplunk-opentelemetry-collector-contrib/processor/resourceprocessor
	go.opentelemetry.io/collector => /Users/ckalbrener/git/opentelemetry-collector
	go.opentelemetry.io/collector/client => /Users/ckalbrener/git/opentelemetry-collector/client
	go.opentelemetry.io/collector/component => /Users/ckalbrener/git/opentelemetry-collector/component
	go.opentelemetry.io/collector/component/componentstatus => /Users/ckalbrener/git/opentelemetry-collector/component/componentstatus
	go.opentelemetry.io/collector/component/componenttest => /Users/ckalbrener/git/opentelemetry-collector/component/componenttest
	go.opentelemetry.io/collector/config/configauth => /Users/ckalbrener/git/opentelemetry-collector/config/configauth
	go.opentelemetry.io/collector/config/configcompression => /Users/ckalbrener/git/opentelemetry-collector/config/configcompression
	go.opentelemetry.io/collector/config/configgrpc => /Users/ckalbrener/git/opentelemetry-collector/config/configgrpc
	go.opentelemetry.io/collector/config/confighttp => /Users/ckalbrener/git/opentelemetry-collector/config/confighttp
	go.opentelemetry.io/collector/config/configmiddleware => /Users/ckalbrener/git/opentelemetry-collector/config/configmiddleware
	go.opentelemetry.io/collector/config/confignet => /Users/ckalbrener/git/opentelemetry-collector/config/confignet
	go.opentelemetry.io/collector/config/configopaque => /Users/ckalbrener/git/opentelemetry-collector/config/configopaque
	go.opentelemetry.io/collector/config/configoptional => /Users/ckalbrener/git/opentelemetry-collector/config/configoptional
	go.opentelemetry.io/collector/config/configretry => /Users/ckalbrener/git/opentelemetry-collector/config/configretry
	go.opentelemetry.io/collector/config/configtelemetry => /Users/ckalbrener/git/opentelemetry-collector/config/configtelemetry
	go.opentelemetry.io/collector/config/configtls => /Users/ckalbrener/git/opentelemetry-collector/config/configtls
	go.opentelemetry.io/collector/confmap => /Users/ckalbrener/git/opentelemetry-collector/confmap
	go.opentelemetry.io/collector/confmap/provider/envprovider => /Users/ckalbrener/git/opentelemetry-collector/confmap/provider/envprovider
	go.opentelemetry.io/collector/confmap/provider/fileprovider => /Users/ckalbrener/git/opentelemetry-collector/confmap/provider/fileprovider
	go.opentelemetry.io/collector/confmap/provider/httpprovider => /Users/ckalbrener/git/opentelemetry-collector/confmap/provider/httpprovider
	go.opentelemetry.io/collector/confmap/provider/httpsprovider => /Users/ckalbrener/git/opentelemetry-collector/confmap/provider/httpsprovider
	go.opentelemetry.io/collector/confmap/provider/yamlprovider => /Users/ckalbrener/git/opentelemetry-collector/confmap/provider/yamlprovider
	go.opentelemetry.io/collector/confmap/xconfmap => /Users/ckalbrener/git/opentelemetry-collector/confmap/xconfmap
	go.opentelemetry.io/collector/connector => /Users/ckalbrener/git/opentelemetry-collector/connector
	go.opentelemetry.io/collector/connector/connectortest => /Users/ckalbrener/git/opentelemetry-collector/connector/connectortest
	go.opentelemetry.io/collector/connector/xconnector => /Users/ckalbrener/git/opentelemetry-collector/connector/xconnector
	go.opentelemetry.io/collector/consumer => /Users/ckalbrener/git/opentelemetry-collector/consumer
	go.opentelemetry.io/collector/consumer/consumererror => /Users/ckalbrener/git/opentelemetry-collector/consumer/consumererror
	go.opentelemetry.io/collector/consumer/consumertest => /Users/ckalbrener/git/opentelemetry-collector/consumer/consumertest
	go.opentelemetry.io/collector/consumer/tagsconsumer => /Users/ckalbrener/git/opentelemetry-collector/consumer/tagsconsumer
	go.opentelemetry.io/collector/consumer/xconsumer => /Users/ckalbrener/git/opentelemetry-collector/consumer/xconsumer
	go.opentelemetry.io/collector/exporter => /Users/ckalbrener/git/opentelemetry-collector/exporter
	go.opentelemetry.io/collector/exporter/debugexporter => /Users/ckalbrener/git/opentelemetry-collector/exporter/debugexporter
	go.opentelemetry.io/collector/exporter/exporterhelper => /Users/ckalbrener/git/opentelemetry-collector/exporter/exporterhelper
	go.opentelemetry.io/collector/exporter/exportertest => /Users/ckalbrener/git/opentelemetry-collector/exporter/exportertest
	go.opentelemetry.io/collector/exporter/nopexporter => /Users/ckalbrener/git/opentelemetry-collector/exporter/nopexporter
	go.opentelemetry.io/collector/exporter/otlpexporter => /Users/ckalbrener/git/opentelemetry-collector/exporter/otlpexporter
	go.opentelemetry.io/collector/exporter/otlphttpexporter => /Users/ckalbrener/git/opentelemetry-collector/exporter/otlphttpexporter
	go.opentelemetry.io/collector/exporter/xexporter => /Users/ckalbrener/git/opentelemetry-collector/exporter/xexporter
	go.opentelemetry.io/collector/extension => /Users/ckalbrener/git/opentelemetry-collector/extension
	go.opentelemetry.io/collector/extension/extensionauth => /Users/ckalbrener/git/opentelemetry-collector/extension/extensionauth
	go.opentelemetry.io/collector/extension/extensioncapabilities => /Users/ckalbrener/git/opentelemetry-collector/extension/extensioncapabilities
	go.opentelemetry.io/collector/extension/extensionmiddleware => /Users/ckalbrener/git/opentelemetry-collector/extension/extensionmiddleware
	go.opentelemetry.io/collector/extension/extensiontest => /Users/ckalbrener/git/opentelemetry-collector/extension/extensiontest
	go.opentelemetry.io/collector/extension/memorylimiterextension => /Users/ckalbrener/git/opentelemetry-collector/extension/memorylimiterextension
	go.opentelemetry.io/collector/extension/xextension => /Users/ckalbrener/git/opentelemetry-collector/extension/xextension
	go.opentelemetry.io/collector/extension/zpagesextension => /Users/ckalbrener/git/opentelemetry-collector/extension/zpagesextension
	go.opentelemetry.io/collector/featuregate => /Users/ckalbrener/git/opentelemetry-collector/featuregate
	go.opentelemetry.io/collector/filter => /Users/ckalbrener/git/opentelemetry-collector/filter
	go.opentelemetry.io/collector/internal/componentalias => /Users/ckalbrener/git/opentelemetry-collector/internal/componentalias
	go.opentelemetry.io/collector/internal/fanoutconsumer => /Users/ckalbrener/git/opentelemetry-collector/internal/fanoutconsumer
	go.opentelemetry.io/collector/internal/memorylimiter => /Users/ckalbrener/git/opentelemetry-collector/internal/memorylimiter
	go.opentelemetry.io/collector/internal/sharedcomponent => /Users/ckalbrener/git/opentelemetry-collector/internal/sharedcomponent
	go.opentelemetry.io/collector/internal/telemetry => /Users/ckalbrener/git/opentelemetry-collector/internal/telemetry
	go.opentelemetry.io/collector/otelcol => /Users/ckalbrener/git/opentelemetry-collector/otelcol
	go.opentelemetry.io/collector/pdata => /Users/ckalbrener/git/opentelemetry-collector/pdata
	go.opentelemetry.io/collector/pdata/pprofile => /Users/ckalbrener/git/opentelemetry-collector/pdata/pprofile
	go.opentelemetry.io/collector/pdata/testdata => /Users/ckalbrener/git/opentelemetry-collector/pdata/testdata
	go.opentelemetry.io/collector/pipeline => /Users/ckalbrener/git/opentelemetry-collector/pipeline
	go.opentelemetry.io/collector/processor => /Users/ckalbrener/git/opentelemetry-collector/processor
	go.opentelemetry.io/collector/processor/processortest => /Users/ckalbrener/git/opentelemetry-collector/processor/processortest
	go.opentelemetry.io/collector/processor/xprocessor => /Users/ckalbrener/git/opentelemetry-collector/processor/xprocessor
	go.opentelemetry.io/collector/receiver => /Users/ckalbrener/git/opentelemetry-collector/receiver
	go.opentelemetry.io/collector/receiver/nopreceiver => /Users/ckalbrener/git/opentelemetry-collector/receiver/nopreceiver
	go.opentelemetry.io/collector/receiver/otlpreceiver => /Users/ckalbrener/git/opentelemetry-collector/receiver/otlpreceiver
	go.opentelemetry.io/collector/receiver/receivertest => /Users/ckalbrener/git/opentelemetry-collector/receiver/receivertest
	go.opentelemetry.io/collector/receiver/xreceiver => /Users/ckalbrener/git/opentelemetry-collector/receiver/xreceiver
	go.opentelemetry.io/collector/scraper => /Users/ckalbrener/git/opentelemetry-collector/scraper
	go.opentelemetry.io/collector/scraper/scraperhelper => /Users/ckalbrener/git/opentelemetry-collector/scraper/scraperhelper
	go.opentelemetry.io/collector/service => /Users/ckalbrener/git/opentelemetry-collector/service
)
