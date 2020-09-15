apiVersion: v1
kind: Service
metadata:
  name: {{ include "core.fullname" . }}
  labels:
    {{- include "core.labels" . | nindent 4 }}
spec:
  type: {{ .Values.service.type }}
  ports:
    - port: {{ .Values.service.port }}
      targetPort: http
      protocol: TCP
      name: http
  selector:
    {{- include "core.selectorLabels" . | nindent 4 }}
---
apiVersion: v1
kind: Service
metadata:
  name: {{ include "core.fullname" . }}-headless
  labels:
    {{- include "core.labels" . | nindent 4 }}
spec:
  clusterIP: None
  ports:
    - port: {{ .Values.service.port }}
      targetPort: http
      protocol: TCP
      name: http
  selector:
    {{- include "core.selectorLabels" . | nindent 4 }}