apiVersion: v1
kind: ConfigMap
metadata:
  name: {{ include "rubbersoul.fullname" . }}
  labels:
    {{- include "rubbersoul.labels" . | nindent 4 }}
data:
  {{- range $key, $val := .Values.configmap }}
  {{ $key }}: {{ $val | quote }}
  {{- end }}
