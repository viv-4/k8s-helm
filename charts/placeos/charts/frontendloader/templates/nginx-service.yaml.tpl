apiVersion: v1
kind: Service
metadata:
  name: {{ include "frontend-loader.fullname" . }}-http
  labels:
    {{- include "frontend-loader.labels" . | nindent 4 }}
spec:
  type: {{ .Values.httpservice.type }}
  ports:
    - port: {{ .Values.httpservice.port }}
      targetPort: http-nginx
      protocol: TCP
      name: http
  selector:
    {{- include "frontend-loader.selectorLabels" . | nindent 4 }}
