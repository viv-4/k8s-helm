kind: Secret
apiVersion: v1
metadata:
  name: {{ include "rubbersoul.fullname" . }}
  labels:
    {{- include "rubbersoul.labels" . | nindent 4 }}
  annotations:
    "helm.sh/hook": "pre-install"
    "helm.sh/hook-delete-policy": "before-hook-creation"
stringData:
  {{- toYaml .Values.secrets | nindent 2 }}
