apiVersion: v1
kind: Service
metadata:
  name: {{ include "frontend-loader.fullname" . }}
  labels:
    {{- include "frontend-loader.labels" . | nindent 4 }}
spec:
  type: {{ .Values.service.type }}
  ports:
    - port: {{ .Values.service.port }}
      targetPort: http
      protocol: TCP
      name: http
  selector:
    {{- include "frontend-loader.selectorLabels" . | nindent 4 }}
