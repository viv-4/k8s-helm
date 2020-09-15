apiVersion: v1
kind: Service
metadata:
  name: {{ include "dispatch.fullname" . }}
  labels:
    {{- include "dispatch.labels" . | nindent 4 }}
spec:
  type: {{ .Values.service.type }}
  ports:
    - port: {{ .Values.service.port }}
      targetPort: http
      protocol: TCP
      name: http
  selector:
    {{- include "dispatch.selectorLabels" . | nindent 4 }}