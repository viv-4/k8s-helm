kind: Secret
apiVersion: v1
metadata:
  name: {{ include "dispatch.fullname" . }}
  labels:
    {{- include "dispatch.labels" . | nindent 4 }}
  annotations:
    "helm.sh/hook": "pre-install"
    "helm.sh/hook-delete-policy": "before-hook-creation"
stringData:
  {{- toYaml .Values.secrets | nindent 2 }}
