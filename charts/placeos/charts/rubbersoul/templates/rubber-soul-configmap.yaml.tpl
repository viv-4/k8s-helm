apiVersion: v1
kind: ConfigMap
metadata:
  name: {{ include "rubbersoul.fullname" . }}
  labels:
    {{- include "rubbersoul.labels" . | nindent 4 }}
  annotations:
    "helm.sh/hook": "pre-install"
    "helm.sh/hook-delete-policy": "before-hook-creation"
data:
  {{- range $key, $val := .Values.configmap }}
  {{ $key }}: {{ $val | quote }}
  {{- end }}
