apiVersion: v1
kind: ConfigMap
metadata:
  name: {{ include "rubber-soul.fullname" . }}
  labels:
    {{- include "rubber-soul.labels" . | nindent 4 }}
data:
  {{- range $key, $val := .Values.configmap }}
  {{ $key }}: {{ $val | quote }}
  {{- end }}
