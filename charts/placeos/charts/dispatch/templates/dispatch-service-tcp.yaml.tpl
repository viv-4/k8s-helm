{{- if .Values.tcpLoadbalancer.portMappings }}
apiVersion: v1
kind: Service
metadata:
  name: {{ include "dispatch.fullname" . }}-tcp
  labels:
    {{- include "dispatch.labels" . | nindent 4 }}
  {{- with .Values.tcpLoadbalancer.annotations }}
  annotations:
    {{- toYaml . | nindent 4 }}
  {{- end }}
spec:
  type: {{ .Values.tcpLoadbalancer.type }}
  ports:
  {{- range $_ , $value := .Values.tcpLoadbalancer.portMappings }}
  {{- range $lbPort, $podPort := $value }}
    - port: {{ $lbPort }}
      targetPort: tcp-{{ $podPort }}
      protocol: TCP
      name: tcp-{{ $lbPort }}
  {{- end }}
  {{- end }}
  selector:
    {{- include "dispatch.selectorLabels" . | nindent 4 }}
{{- end }}