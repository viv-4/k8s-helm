apiVersion: v1
kind: ConfigMap
metadata:
  name: {{ include "triggers.fullname" . }}
  labels:
    {{- include "triggers.labels" . | nindent 4 }}
data:
  {{- range $key, $val := .Values.configmap }}
  {{ $key }}: {{ $val | quote }}
  {{- end }}
