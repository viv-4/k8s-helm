apiVersion: v1
kind: Service
metadata:
  name: {{ include "search-ingest.fullname" . }}
  labels:
    {{- include "search-ingest.labels" . | nindent 4 }}
spec:
  type: {{ .Values.service.type }}
  ports:
    - port: {{ .Values.service.port }}
      targetPort: http
      protocol: TCP
      name: http
  selector:
    {{- include "search-ingest.selectorLabels" . | nindent 4 }}
