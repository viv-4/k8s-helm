kind: Secret
apiVersion: v1
metadata:
  name: {{ include "rubbersoul.fullname" . }}
  labels:
    {{- include "rubbersoul.labels" . | nindent 4 }}
stringData:
  {{- toYaml .Values.secrets | nindent 2 }}
