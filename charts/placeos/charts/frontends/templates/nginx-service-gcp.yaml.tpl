{{- if .Values.global.gcpbackendConfig.enabled }}
apiVersion: v1
kind: Service
metadata:
  name: {{ include "frontend-loader.fullname" . }}-http-gcp
  annotations:
    cloud.google.com/backend-config: '{"ports": {"{{ .Values.httpservice.port }}":"{{.Values.global.gcpbackendConfig.name }}"}}'
    cloud.google.com/neg: '{"ingress": true}'
  labels:
    {{- include "frontend-loader.labels" . | nindent 4 }}
spec:
  type: NodePort
  ports:
    - port: {{ .Values.httpservice.port }}
      targetPort: http-nginx
      protocol: TCP
  selector:
    {{- include "frontend-loader.selectorLabels" . | nindent 4 }}
    placeos.backend/type: "gcp" 
{{- end }}
