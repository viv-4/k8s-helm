kind: Secret
apiVersion: v1
metadata:
  name: {{ include "dispatch.fullname" . }}
  labels:
    {{- include "dispatch.labels" . | nindent 4 }}
stringData:
  {{- toYaml .Values.secrets | nindent 2 }}
