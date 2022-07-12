apiVersion: v1
kind: Service
metadata:
  name: {{ include "staff.fullname" . }}
  labels:
    {{- include "staff.labels" . | nindent 4 }}
spec:
  type: {{ .Values.service.type }}
  ports:
    - port: {{ .Values.service.port }}
      targetPort: http
      protocol: TCP
      name: http
  selector:
    {{- include "staff.selectorLabels" . | nindent 4 }}
