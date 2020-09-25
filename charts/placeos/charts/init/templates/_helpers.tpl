{{/*
Expand the name of the chart.
*/}}
{{- define "init.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "init.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "init.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "init.labels" -}}
helm.sh/chart: {{ include "init.chart" . }}
{{ include "init.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "init.selectorLabels" -}}
app.kubernetes.io/name: {{ include "init.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "init.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "init.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{/*
Generate certificates for ingress server
*/}}
{{- define "tls.gen-certs" -}}
{{- $altNames := concat  ( list .Values.global.placeDomain )  .Values.domain.altNames  -}}
{{- $ca := genCA "placeos-ca" 365 -}}
{{- $cert := genSignedCert ( .Values.global.placeDomain ) nil $altNames 365 $ca -}}
tls.crt: {{ $cert.Cert | b64enc }}
tls.key: {{ $cert.Key | b64enc }}
{{- end -}}

{{/* custom oath redirect port for non-standard http or https ports */}}
{{- define "init.redirectURI" -}}
{{- if .Values.global.customRedirectPort }}
{{- print .Values.global.placeDomain ":" .Values.global.customRedirectPort | quote }}
{{- else -}}
{{- print .Values.global.placeDomain }}
{{- end }}
{{- end -}}
