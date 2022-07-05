{{- if not .Values.httpSidecar -}}
apiVersion: apps/v1
kind: Deployment
metadata:
  name: {{ include "frontends.fullname" . }}-nginx
  labels:
    {{- include "frontends.labels" . | nindent 4 }}
spec:
  replicas: {{ .Values.httpDeployment.replicaCount }}
  selector:
    matchLabels:
      {{- include "frontends.selectorLabels" . | nindent 6 }}
  template:
    metadata:
    {{- with .Values.httpDeployment.podAnnotations }}
      annotations:
        {{- toYaml . | nindent 8 }}
    {{- end }}
      labels:
        {{- include "frontends.selectorLabels" . | nindent 8 }}
    spec:
      {{- with .Values.httpDeployment.imagePullSecrets }}
      imagePullSecrets:
        {{- toYaml . | nindent 8 }}
      {{- end }}
      serviceAccountName: {{ include "frontends.serviceAccountName" . }}
      securityContext:
          {{- toYaml .Values.httpDeployment.podSecurityContext | nindent 8 }}
      containers:
      - name: {{ .Chart.Name }}
        securityContext:
          {{- toYaml .Values.httpDeployment.securityContext | nindent 12 }}
        image: "{{ .Values.httpDeployment.image.repository }}:{{ .Values.httpDeployment.image.tag }}"
        imagePullPolicy: "{{ .Values.httpDeployment.image.pullPolicy }}"
        ports:
        - containerPort: 8080
          name: http-nginx
        resources:
          {{- toYaml .Values.httpDeployment.resources | nindent 12 }}
        volumeMounts:
        - mountPath: /usr/share/nginx/html/
          name: www
          readOnly: true
        - mountPath: /etc/nginx/conf.d/
          name: default-conf
          readOnly: true
        - mountPath: /var/cache/nginx
          name: cache
        - mountPath: /var/run/
          name: pid
      {{- if .Values.httpDeployment.podPriorityClassName }}
      priorityClassName: {{ .Values.httpDeployment.podPriorityClassName }}
      {{ end }}
      {{- with .Values.httpDeployment.nodeSelector }}
      nodeSelector:
        {{- toYaml . | nindent 8 }}
      {{- end }}
      {{- with .Values.httpDeployment.affinity }}
      affinity:
        {{- toYaml . | nindent 8 }}
      {{- end }}
      {{- with .Values.httpDeployment.tolerations }}
      tolerations:
        {{- toYaml . | nindent 8 }}
      {{- end }}
      restartPolicy: Always
      volumes:
      - name: cache
        emptyDir: {}
      - name: pid
        emptyDir: {}
      - name: www
        persistentVolumeClaim:
          claimName: {{ .Values.persistentVolume.name }}
      - name: default-conf
        configMap:
          name: {{ include "frontends.fullname" . }}-nginx-conf
{{- end -}}
