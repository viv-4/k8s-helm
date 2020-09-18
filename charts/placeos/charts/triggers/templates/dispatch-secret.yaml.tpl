kind: Secret
apiVersion: v1
metadata:
  name: {{ include "triggers.fullname" . }}
  labels:
    {{- include "triggers.labels" . | nindent 4 }}
stringData:
  {{- toYaml .Values.secrets | nindent 2 }}
