apiVersion: v1
kind: Service
metadata:
  name: {{ include "rubbersoul.fullname" . }}
  labels:
    {{- include "rubbersoul.labels" . | nindent 4 }}
spec:
  type: {{ .Values.service.type }}
  ports:
    - port: {{ .Values.service.port }}
      targetPort: http
      protocol: TCP
      name: http
  selector:
    {{- include "rubbersoul.selectorLabels" . | nindent 4 }}
