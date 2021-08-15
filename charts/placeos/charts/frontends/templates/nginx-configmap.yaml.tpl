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

        gzip  on;
        gzip_vary on;
        gzip_min_length 10240;
        gzip_proxied expired no-cache no-store private auth;
        gzip_types text/plain text/css text/xml text/javascript application/javascript application/x-javascript application/xml image/svg+xml application/octet-stream application/json;
  
        #charset koi8-r;
        access_log /dev/stdout;

        location / {
            root   /usr/share/nginx/html;
            try_files $uri $uri/index.html backoffice/$uri =404;
        }
      }
