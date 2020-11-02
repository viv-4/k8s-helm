apiVersion: v1
kind: Service
metadata:
  name: {{ include "frontends.fullname" . }}-http
  labels:
    {{- include "frontends.labels" . | nindent 4 }}
spec:
  type: {{ .Values.httpservice.type }}
  ports:
    - port: {{ .Values.httpservice.port }}
      targetPort: http-nginx
      protocol: TCP
      name: http
  selector:
    {{- include "frontends.selectorLabels" . | nindent 4 }}
