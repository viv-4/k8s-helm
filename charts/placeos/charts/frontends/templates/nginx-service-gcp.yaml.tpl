{{- if .Values.global.gcpbackendConfig.enabled }}
apiVersion: v1
kind: Service
metadata:
  name: {{ include "frontends.fullname" . }}-http-gcp
  annotations:
    cloud.google.com/backend-config: '{"ports": {"{{ .Values.httpservice.port }}":"{{.Values.global.gcpbackendConfig.name }}"}}'
    cloud.google.com/neg: '{"ingress": true}'
  labels:
    {{- include "frontends.labels" . | nindent 4 }}
spec:
  type: NodePort
  ports:
    - port: {{ .Values.httpservice.port }}
      targetPort: 8080
      protocol: TCP
  selector:
    {{- include "frontends.selectorLabels" . | nindent 4 }}
    placeos.backend/type: "gcp" 
{{- end }}