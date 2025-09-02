{{- define "chart.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "chart.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}

{{- define "chart.labels" -}}
app.kubernetes.io/name: {{ include "chart.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/version: {{ .Chart.Version | quote }}
app.kubernetes.io/part-of: {{ default "monitoring" .Values.common.partOf }}
{{- if .Values.common.component }}
app.kubernetes.io/component: {{ .Values.common.component }}
{{- end }}
{{- end -}}

{{- define "chart.selectorLabels" -}}
app.kubernetes.io/name: {{ include "chart.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}

{{- define "chart.mergeLabels" -}}
{{- $base := include "chart.labels" . | fromYaml -}}
{{- $extra := .Values.common.labels | default dict -}}
{{- $merged := merge $base $extra -}}
{{- toYaml $merged -}}
{{- end -}}

{{- define "chart.mergeAnnotations" -}}
{{- toYaml (.Values.common.annotations | default dict) -}}
{{- end -}}
