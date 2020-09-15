apiVersion: v1
kind: ConfigMap
metadata:
  name: {{ include "frontends.fullname" . }}
  labels:
    {{- include "frontends.labels" . | nindent 4 }}
data:
  {{- range $key, $val := .Values.configmap }}
  {{ $key }}: {{ $val | quote }}
  {{- end }}
