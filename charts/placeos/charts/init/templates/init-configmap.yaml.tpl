apiVersion: v1
kind: ConfigMap
metadata:
  name: {{ include "init.fullname" . }}
  labels:
    {{- include "init.labels" . | nindent 4 }}
data:
  {{- range $key, $val := .Values.configmap }}
  {{ $key }}: {{ $val | quote }}
  {{- end }}
  PLACE_DOMAIN: {{ include "init.redirectURI" . }}
