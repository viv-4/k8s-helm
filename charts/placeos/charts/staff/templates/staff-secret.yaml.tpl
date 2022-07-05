kind: Secret
apiVersion: v1
metadata:
  name: {{ include "staff.fullname" . }}
  labels:
    {{- include "staff.labels" . | nindent 4 }}
  annotations:
    "helm.sh/hook": "pre-install"
    "helm.sh/hook-delete-policy": "before-hook-creation"
stringData:
  PG_DATABASE_URL: postgresql://{{ .Values.postgresqlUsername }}:{{ .Values.postgresqlPassword }}@postgresql/{{ .Values.postgresqlDatabase }}
  {{- toYaml .Values.secrets | nindent 2 }}
