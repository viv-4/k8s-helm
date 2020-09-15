apiVersion: v1
kind: ConfigMap
metadata:
  name: {{ include "auth.fullname" . }}
  labels:
    {{- include "auth.labels" . | nindent 4 }}
data:
  {{- range $key, $val := .Values.configmap }}
  {{ $key }}: {{ $val | quote }}
  {{- end }}
