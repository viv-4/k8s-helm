apiVersion: v1
kind: Service
metadata:
  name: {{ include "rubber-soul.fullname" . }}
  labels:
    {{- include "rubber-soul.labels" . | nindent 4 }}
spec:
  type: {{ .Values.service.type }}
  ports:
    - port: {{ .Values.service.port }}
      targetPort: http
      protocol: TCP
      name: http
  selector:
    {{- include "rubber-soul.selectorLabels" . | nindent 4 }}
