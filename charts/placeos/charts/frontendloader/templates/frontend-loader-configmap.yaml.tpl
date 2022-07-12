apiVersion: v1
kind: ConfigMap
metadata:
  name: {{ include "frontend-loader.fullname" . }}
  labels:
    {{- include "frontend-loader.labels" . | nindent 4 }}
  annotations:
    "helm.sh/hook": "pre-install"
    "helm.sh/hook-delete-policy": "before-hook-creation"
data:
  {{- range $key, $val := .Values.configmap }}
  {{ $key }}: {{ $val | quote }}
  {{- end }}
