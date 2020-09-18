kind: Secret
apiVersion: v1
metadata:
  name: {{ include "rubber-soul.fullname" . }}
  labels:
    {{- include "rubber-soul.labels" . | nindent 4 }}
stringData:
  {{- toYaml .Values.secrets | nindent 2 }}
