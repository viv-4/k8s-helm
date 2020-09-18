kind: Secret
apiVersion: v1
metadata:
  name: {{ include "auth.fullname" . }}
  labels:
    {{- include "auth.labels" . | nindent 4 }}
stringData:
  {{- toYaml .Values.secrets | nindent 2 }}
