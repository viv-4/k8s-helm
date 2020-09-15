apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: {{ .Values.persistentVolume.name }}
  annotations:
    pv.beta.kubernetes.io/gid: {{ .Values.deployment.podSecurityContext.fsGroup | quote }}
spec:
  accessModes:
    {{- toYaml .Values.persistentVolume.accessModes | nindent 4 }}
  resources:
    requests:
      storage: {{ .Values.persistentVolume.storage }}



## See front end loader: https://github.com/PlaceOS/www-core