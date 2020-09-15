apiVersion: v1
kind: Service
metadata:
  name: {{ include "triggers.fullname" . }}
  labels:
    {{- include "triggers.labels" . | nindent 4 }}
spec:
  type: {{ .Values.service.type }}
  ports:
    - port: {{ .Values.service.port }}
      targetPort: http
      protocol: TCP
      name: http
  selector:
    {{- include "triggers.selectorLabels" . | nindent 4 }}
