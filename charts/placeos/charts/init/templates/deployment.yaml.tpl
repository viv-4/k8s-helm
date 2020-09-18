apiVersion: batch/v1
kind: Job
metadata:
  name: {{ include "init.fullname" . }}
  labels:
    {{- include "init.labels" . | nindent 4 }}
spec:
  template:
    metadata:
    {{- with .Values.deployment.podAnnotations }}
      annotations:
        {{- toYaml . | nindent 8 }}
    {{- end }}
      labels:
        {{- include "init.selectorLabels" . | nindent 8 }}
    spec:
      {{- with .Values.deployment.imagePullSecrets }}
      imagePullSecrets:
        {{- toYaml . | nindent 8 }}
      {{- end }}
      serviceAccountName: {{ include "init.serviceAccountName" . }}
      securityContext:
        {{- toYaml .Values.deployment.podSecurityContext | nindent 8 }}
      containers:
        - name: {{ .Chart.Name }}
          securityContext:
            {{- toYaml .Values.deployment.securityContext | nindent 12 }}
          image: "{{ .Values.deployment.image.repository }}:{{ .Values.deployment.image.tag | default .Chart.AppVersion }}"
          imagePullPolicy: {{ .Values.deployment.image.pullPolicy }}
          envFrom:
          - configMapRef:
              name:  {{ include "init.fullname" . }}
          - secretRef:
              name: {{ include "init.fullname" . }}
          resources:
            {{- toYaml .Values.deployment.resources | nindent 12 }}
      restartPolicy: Never
  backoffLimit: 10
