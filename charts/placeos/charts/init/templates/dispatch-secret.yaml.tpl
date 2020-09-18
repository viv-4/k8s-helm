kind: Secret
apiVersion: v1
metadata:
  name: {{ include "init.fullname" . }}
  labels:
    {{- include "init.labels" . | nindent 4 }}
stringData:
  {{- toYaml .Values.secrets | nindent 2 }}
