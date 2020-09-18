kind: Secret
apiVersion: v1
metadata:
  name: {{ include "frontends.fullname" . }}
  labels:
    {{- include "frontends.labels" . | nindent 4 }}
stringData:
  {{- toYaml .Values.secrets | nindent 2 }}
