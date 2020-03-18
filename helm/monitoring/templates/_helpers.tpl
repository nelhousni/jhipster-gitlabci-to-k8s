{{/* vim: set filetype=mustache: */}}
{{/*
prometheus/grafana customisation
*/}}
{{- define "prometheus.name" -}}
{{- default "prometheus" -}}
{{- end -}}

{{- define "prometheus.fullname" -}}
{{- default "prometheus" -}}
{{- end -}}

{{- define "prometheus.server.fullname" -}}
{{- default "prometheus" -}}
{{- end -}}

{{- define "prometheus.pushgateway.fullname" -}}
{{- default "prometheus-pushgateway" -}}
{{- end -}}

{{- define "prometheus.nodeExporter.fullname" -}}
{{- default "prometheus-nodeexporter" -}}
{{- end -}}

{{- define "prometheus.alertmanager.fullname" -}}
{{- default "prometheus-alertmanager" -}}
{{- end -}}

{{- define "grafana.name" -}}
{{- default "grafana" -}}
{{- end -}}

{{- define "grafana.fullname" -}}
{{- default "grafana" -}}
{{- end -}}

