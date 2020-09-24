apiVersion: v1
kind: Secret
type: kubernetes.io/tls
metadata:
  name: {{ .Values.global.placeDomain }}
  labels:
    {{- include "init.labels" . | nindent 4 }}
  annotations:
    "helm.sh/hook": "pre-install"
    "helm.sh/hook-delete-policy": "before-hook-creation"
data:
{{ ( include "tls.gen-certs" . ) | indent 2 }}