apiVersion: v1
kind: ConfigMap
metadata:
  name: {{ include "frontends.fullname" . }}-nginx-conf
  labels:
    {{- include "frontends.labels" . | nindent 4 }}
data:
  default.conf: |
      server {
        listen       8080;
        listen  [::]:8080;
        server_name  localhost;

        #charset koi8-r;
        access_log /dev/stdout;

        location / {
            root   /usr/share/nginx/html;
            try_files $uri $uri/index.html backoffice/$uri =404;
        }
      }
