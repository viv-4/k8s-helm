apiVersion: v1
kind: ConfigMap
metadata:
  name: {{ .Values.etcd.envVarsConfigMap }}
data:
  ALLOW_NONE_AUTHENTICATION: "yes"