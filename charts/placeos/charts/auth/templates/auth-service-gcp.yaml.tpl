{{- if .Values.global.gcpbackendConfig.enabled }}
apiVersion: v1
kind: Service
metadata:
  name: {{ include "auth.fullname" . }}-gcp
  annotations:
    cloud.google.com/backend-config: '{"ports": {"{{ .Values.service.port }}":"{{ .Values.global.gcpbackendConfig.name }}"}}'
    cloud.google.com/neg: '{"ingress": true}'
  labels:
    {{- include "auth.labels" . | nindent 4 }}
spec:
  type: NodePort
  ports:
    - port: {{ .Values.service.port }}
      targetPort: http
      protocol: TCP
      name: http
  selector:
    {{- include "auth.selectorLabels" . | nindent 4 }}
{{- end }}
