apiVersion: v1
kind: Service
metadata:
  name: {{ include "source.fullname" . }}
  labels:
    {{- include "source.labels" . | nindent 4 }}
spec:
  type: {{ .Values.service.type }}
  ports:
    - port: {{ .Values.service.port }}
      targetPort: http
      protocol: TCP
      name: http
  selector:
    {{- include "source.selectorLabels" . | nindent 4 }}
