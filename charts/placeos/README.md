# placeos

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.0.0](https://img.shields.io/badge/AppVersion-1.0.0-informational?style=flat-square)

An Umbrella Chart for PlaceOS and its dependencies

## Requirements

| Repository | Name | Version |
|------------|------|---------|
|  | api | 0.1.0 |
|  | auth | 0.1.0 |
|  | core | 0.1.0 |
|  | dispatch | 0.1.0 |
|  | frontends | 0.1.0 |
|  | init | 0.1.0 |
|  | rubbersoul | 0.1.0 |
|  | triggers | 0.1.0 |
| https://charts.bitnami.com/bitnami | elasticsearch | ~12.6.3 |
| https://charts.bitnami.com/bitnami | etcd | ~4.10.1 |
| https://charts.bitnami.com/bitnami | influxdb | ~0.6.6 |
| https://charts.bitnami.com/bitnami | redis | ~10.8.2 |
| https://halkeye.github.io/helm-charts/ | mosquitto | ~0.2.0 |
| https://kubernetes-charts.storage.googleapis.com/ | rethinkdb | ~1.1.2 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| api.configmap | object | `{"<<":{"RUBBER_SOUL_URI":"http://rubbersoul:3000"}}` | environment variable exposed to containers as a configmap |
| api.configmap.<< | object | `{"RETHINKDB_DB":"place_development","RETHINKDB_HOST":"rethinkdb-proxy","RETHINKDB_PORT":28015,"RETHINKDB_USER":"admin"}` | RethinkDB client variables |
| api.configmap.<< | object | `{"REDIS_URL":"redis://redis-headless:6379"}` | Redis DB client variables |
| api.configmap.<< | object | `{"PLACE_LOADER_URI":"http://frontends:3000"}` | Place Loader client variables |
| api.configmap.<< | object | `{"ENV":"development","SG_ENV":"development","TZ":"Australia/Sydney"}` | PlaceOS deployment client variables |
| api.configmap.<< | object | `{"ES_HOST":"elasticsearch-master","ES_PORT":9200}` | elasticache client variables |
| api.configmap.<< | object | `{"ETCD_HOST":"etcd-headless","ETCD_PORT":2379}` | etcd client variables |
| api.configmap.<<.RETHINKDB_DB | string | `"place_development"` | environment variable exposed to containers |
| api.configmap.<<.RETHINKDB_HOST | string | `"rethinkdb-proxy"` | environment variable exposed to containers |
| api.configmap.<<.RETHINKDB_PORT | int | `28015` | environment variable exposed to containers |
| api.configmap.<<.RETHINKDB_USER | string | `"admin"` | environment variable exposed to containers |
| api.configmap.<<.RUBBER_SOUL_URI | string | `"http://rubbersoul:3000"` | environment variable exposed to containers |
| api.enabled | bool | `true` | api is a core PlaoceOS chart enabled by default. |
| api.fullnameOverride | string | `"api"` |  |
| api.secrets | object | `{"<<":{"RETHINKDB_PASSWORD":"password"}}` | environment variable exposed to the container as secrets |
| api.secrets.<< | object | `{"RETHINKDB_PASSWORD":"password"}` | RethinkDB client variables |
| api.secrets.<<.RETHINKDB_PASSWORD | string | `"password"` | environment variable exposed to containers |
| auth.configmap | object | `{"<<":{"RETHINKDB_DB":"place_development","RETHINKDB_HOST":"rethinkdb-proxy","RETHINKDB_PORT":28015,"RETHINKDB_USER":"admin"},"COAUTH_NO_SSL":"true","TZ":"Australia/Sydney"}` | environment variable exposed to containers |
| auth.configmap.<< | object | `{"RETHINKDB_DB":"place_development","RETHINKDB_HOST":"rethinkdb-proxy","RETHINKDB_PORT":28015,"RETHINKDB_USER":"admin"}` | RethinkDB client variables |
| auth.configmap.<<.RETHINKDB_DB | string | `"place_development"` | environment variable exposed to containers |
| auth.configmap.<<.RETHINKDB_HOST | string | `"rethinkdb-proxy"` | environment variable exposed to containers |
| auth.configmap.<<.RETHINKDB_PORT | int | `28015` | environment variable exposed to containers |
| auth.configmap.<<.RETHINKDB_USER | string | `"admin"` | environment variable exposed to containers |
| auth.enabled | bool | `true` | auth is a core PlaoceOS chart enabled by default. |
| auth.fullnameOverride | string | `"auth"` |  |
| auth.secrets.<< | object | `{"RETHINKDB_PASSWORD":"password"}` | RethinkDB client variables |
| auth.secrets.<<.RETHINKDB_PASSWORD | string | `"password"` | environment variable exposed to containers |
| core.configmap | object | `{"<<":{"ENV":"development","SG_ENV":"development","TZ":"Australia/Sydney"}}` | environment variable exposed to containers |
| core.configmap.<< | object | `{"RETHINKDB_DB":"place_development","RETHINKDB_HOST":"rethinkdb-proxy","RETHINKDB_PORT":28015,"RETHINKDB_USER":"admin"}` | RethinkDB client variables |
| core.configmap.<< | object | `{"ETCD_HOST":"etcd-headless","ETCD_PORT":2379}` | etcd client variables |
| core.configmap.<< | object | `{"REDIS_URL":"redis://redis-headless:6379"}` | Redis DB client variables |
| core.configmap.<< | object | `{"ENV":"development","SG_ENV":"development","TZ":"Australia/Sydney"}` | PlaceOS deployment client variables |
| core.configmap.<<.RETHINKDB_DB | string | `"place_development"` | environment variable exposed to containers |
| core.configmap.<<.RETHINKDB_HOST | string | `"rethinkdb-proxy"` | environment variable exposed to containers |
| core.configmap.<<.RETHINKDB_PORT | int | `28015` | environment variable exposed to containers |
| core.configmap.<<.RETHINKDB_USER | string | `"admin"` | environment variable exposed to containers |
| core.enabled | bool | `true` | core is a core PlaoceOS chart enabled by default. |
| core.fullnameOverride | string | `"core"` |  |
| core.secrets | object | `{"<<":{"RETHINKDB_PASSWORD":"password"}}` | environment variable exposed to the container as secrets |
| core.secrets.<< | object | `{"RETHINKDB_PASSWORD":"password"}` | RethinkDB client variables |
| core.secrets.<<.RETHINKDB_PASSWORD | string | `"password"` | environment variable exposed to containers |
| dispatch.enabled | bool | `true` | dispatch is a core PlaoceOS chart enabled by default. |
| dispatch.fullnameOverride | string | `"dispatch"` |  |
| dispatch.secrets | object | `{"<<":{"SERVER_SECRET":"development"}}` | environment variable exposed to the container as secrets |
| dispatch.secrets.<<.SERVER_SECRET | string | `"development"` | environment variable exposed to containers |
| elasticsearch.coordinating.replicas | int | `0` |  |
| elasticsearch.data.replicas | int | `1` |  |
| elasticsearch.enabled | bool | `false` | elasticsearch chart disabled by default. included for testing purposes only |
| elasticsearch.master.replicas | int | `1` |  |
| elasticsearch.templateOverrides | object | `{"elasticsearchMasterfullName":"elasticsearch-master"}` | templateOverrides. A work around to override the full name of the ElasticSearch master. See templates/_helpers.tpl |
| etcd.auth.rbac.enabled | bool | `false` |  |
| etcd.enabled | bool | `false` | etcd chart disabled by default. included for testing purposes only |
| etcd.fullnameOverride | string | `"etcd"` |  |
| frontends.configmap | object | `{"<<":{"ENV":"development","SG_ENV":"development","TZ":"Australia/Sydney"},"PLACE_LOADER_WWW":"www"}` | environment variable exposed to containers |
| frontends.configmap.<< | object | `{"RETHINKDB_DB":"place_development","RETHINKDB_HOST":"rethinkdb-proxy","RETHINKDB_PORT":28015,"RETHINKDB_USER":"admin"}` | RethinkDB client variables |
| frontends.configmap.<< | object | `{"ENV":"development","SG_ENV":"development","TZ":"Australia/Sydney"}` | PlaceOS deployment client variables |
| frontends.configmap.<<.RETHINKDB_DB | string | `"place_development"` | environment variable exposed to containers |
| frontends.configmap.<<.RETHINKDB_HOST | string | `"rethinkdb-proxy"` | environment variable exposed to containers |
| frontends.configmap.<<.RETHINKDB_PORT | int | `28015` | environment variable exposed to containers |
| frontends.configmap.<<.RETHINKDB_USER | string | `"admin"` | environment variable exposed to containers |
| frontends.configmap.PLACE_LOADER_WWW | string | `"www"` | path to static html resources |
| frontends.enabled | bool | `true` | frontends is a core PlaoceOS chart enabled by default. |
| frontends.fullnameOverride | string | `"frontends"` |  |
| frontends.httpSidecar | bool | `true` |  |
| frontends.secrets | object | `{"<<":{"RETHINKDB_PASSWORD":"password"}}` | environment variable exposed to the container as secrets |
| frontends.secrets.<< | object | `{"RETHINKDB_PASSWORD":"password"}` | RethinkDB client variables |
| frontends.secrets.<<.RETHINKDB_PASSWORD | string | `"password"` | environment variable exposed to containers |
| global.customRedirectPort | string | `nil` | customRedirectPort the port the API and Frontend services are listening on. Leave as null if using standard ports. ie 80 or 443. Used by the init service to configure the appropriate services |
| global.placeDomain | string | `nil` |  |
| influxdb.enabled | bool | `false` |  |
| influxdb.fullnameOverride | string | `"influxdb"` |  |
| init.config | object | `{"<<":{"RETHINKDB_PASSWORD":"password"}}` | environment variable exposed to containers |
| init.config.<< | object | `{"ES_HOST":"elasticsearch-master","ES_PORT":9200}` | elasticache client variables |
| init.config.<< | object | `{"RETHINKDB_DB":"place_development","RETHINKDB_HOST":"rethinkdb-proxy","RETHINKDB_PORT":28015,"RETHINKDB_USER":"admin"}` | RethinkDB client variables |
| init.config.<< | object | `{"PLACE_APPLICATION":"backoffice","PLACE_AUTH_HOST":"auth:3000","PLACE_EMAIL":"support@place.tech","PLACE_TLS":true,"PLACE_USERNAME":"Place Support"}` | Place Domain initialisation variables |
| init.config.<< | object | `{"ENV":"development","SG_ENV":"development","TZ":"Australia/Sydney"}` | PlaceOS deployment client variables |
| init.config.<< | object | `{"RETHINKDB_PASSWORD":"password"}` | RethinkDB client variables |
| init.config.<<.PLACE_APPLICATION | string | `"backoffice"` | environment variable exposed to containers |
| init.config.<<.PLACE_AUTH_HOST | string | `"auth:3000"` | environment variable exposed to containers |
| init.config.<<.PLACE_EMAIL | string | `"support@place.tech"` | environment variable exposed to containers |
| init.config.<<.PLACE_TLS | bool | `true` | environment variable exposed to containers |
| init.config.<<.PLACE_USERNAME | string | `"Place Support"` | environment variable exposed to containers |
| init.config.<<.RETHINKDB_DB | string | `"place_development"` | environment variable exposed to containers |
| init.config.<<.RETHINKDB_HOST | string | `"rethinkdb-proxy"` | environment variable exposed to containers |
| init.config.<<.RETHINKDB_PASSWORD | string | `"password"` | environment variable exposed to containers |
| init.config.<<.RETHINKDB_PORT | int | `28015` | environment variable exposed to containers |
| init.config.<<.RETHINKDB_USER | string | `"admin"` | environment variable exposed to containers |
| init.enabled | bool | `true` | init is a core PlaoceOS chart enabled by default. |
| init.fullnameOverride | string | `"init"` |  |
| init.secrets | object | `{"PLACE_PASSWORD":"development"}` | environment variable exposed to the container as secrets |
| init.secrets.PLACE_PASSWORD | string | `"development"` | Default password for initial users in domain |
| mosquitto.enabled | bool | `false` | mosquitto chart disabled by default. included for testing purposes only |
| mosquitto.fullnameOverride | string | `"mosquitto"` |  |
| redis.cluster.enabled | bool | `false` |  |
| redis.configmap | string | `"notify-keyspace-events Kg$"` |  |
| redis.enabled | bool | `false` | redis chart disabled by default. included for testing purposes only |
| redis.fullnameOverride | string | `"redis"` |  |
| redis.usePassword | bool | `false` |  |
| rethinkdb.cluster.replicas | int | `1` |  |
| rethinkdb.enabled | bool | `false` | rethinkdb chart disabled by default. included for testing purposes only |
| rethinkdb.rethinkdbPassword | string | `"password"` |  |
| rethinkdb.templateOverrides | object | `{"rethinkdbFullName":"rethinkdb"}` | templateOverrides. A work around to override the full name of the RethinkDb deployment. See templates/_helpers.tpl |
| rubbersoul.configmap | object | `{"<<":{"ENV":"development","SG_ENV":"development","TZ":"Australia/Sydney"}}` | environment variable exposed to containers |
| rubbersoul.configmap.<< | object | `{"ES_HOST":"elasticsearch-master","ES_PORT":9200}` | elasticache client variables |
| rubbersoul.configmap.<< | object | `{"ENV":"development","SG_ENV":"development","TZ":"Australia/Sydney"}` | PlaceOS deployment client variables |
| rubbersoul.configmap.<< | object | `{"RETHINKDB_DB":"place_development","RETHINKDB_HOST":"rethinkdb-proxy","RETHINKDB_PORT":28015,"RETHINKDB_USER":"admin"}` | RethinkDB client variables |
| rubbersoul.configmap.<<.RETHINKDB_DB | string | `"place_development"` | environment variable exposed to containers |
| rubbersoul.configmap.<<.RETHINKDB_HOST | string | `"rethinkdb-proxy"` | environment variable exposed to containers |
| rubbersoul.configmap.<<.RETHINKDB_PORT | int | `28015` | environment variable exposed to containers |
| rubbersoul.configmap.<<.RETHINKDB_USER | string | `"admin"` | environment variable exposed to containers |
| rubbersoul.enabled | bool | `true` | rubbersoul is a core PlaoceOS chart enabled by default. |
| rubbersoul.fullnameOverride | string | `"rubbersoul"` |  |
| rubbersoul.secrets | object | `{"<<":{"RETHINKDB_PASSWORD":"password"}}` | environment variable exposed to the container as secrets |
| rubbersoul.secrets.<< | object | `{"RETHINKDB_PASSWORD":"password"}` | RethinkDB client variables |
| rubbersoul.secrets.<<.RETHINKDB_PASSWORD | string | `"password"` | environment variable exposed to containers |
| triggers.configmap | object | `{"<<":{"ENV":"development","SG_ENV":"development","TZ":"Australia/Sydney"}}` | environment variable exposed to containers |
| triggers.configmap.<< | object | `{"ENV":"development","SG_ENV":"development","TZ":"Australia/Sydney"}` | PlaceOS deployment client variables |
| triggers.configmap.<< | object | `{"RETHINKDB_DB":"place_development","RETHINKDB_HOST":"rethinkdb-proxy","RETHINKDB_PORT":28015,"RETHINKDB_USER":"admin"}` | RethinkDB client variables |
| triggers.configmap.<< | object | `{"REDIS_URL":"redis://redis-headless:6379"}` | Redis DB client variables |
| triggers.configmap.<< | object | `{"ETCD_HOST":"etcd-headless","ETCD_PORT":2379}` | etcd client variables |
| triggers.configmap.<< | object | `{"SMTP_PORT":587,"SMTP_SECURE":"","SMTP_SERVER":"","SMTP_USER":""}` | SMTP client variables |
| triggers.configmap.<<.RETHINKDB_DB | string | `"place_development"` | environment variable exposed to containers |
| triggers.configmap.<<.RETHINKDB_HOST | string | `"rethinkdb-proxy"` | environment variable exposed to containers |
| triggers.configmap.<<.RETHINKDB_PORT | int | `28015` | environment variable exposed to containers |
| triggers.configmap.<<.RETHINKDB_USER | string | `"admin"` | environment variable exposed to containers |
| triggers.configmap.<<.SMTP_PORT | int | `587` | environment variable exposed to containers |
| triggers.configmap.<<.SMTP_SECURE | string | `""` | environment variable exposed to containers |
| triggers.configmap.<<.SMTP_SERVER | string | `""` | environment variable exposed to containers |
| triggers.configmap.<<.SMTP_USER | string | `""` | environment variable exposed to containers |
| triggers.enabled | bool | `true` | triggers is a core PlaoceOS chart enabled by default. |
| triggers.fullnameOverride | string | `"triggers"` |  |
| triggers.secrets | object | `{"<<":{"SMTP_PASS":""}}` | environment variable exposed to the container as secrets |
| triggers.secrets.<< | object | `{"SMTP_PASS":""}` | SMTP client variables |
| triggers.secrets.<< | object | `{"RETHINKDB_PASSWORD":"password"}` | RethinkDB client variables |
| triggers.secrets.<<.RETHINKDB_PASSWORD | string | `"password"` | environment variable exposed to containers |
| triggers.secrets.<<.SMTP_PASS | string | `""` | environment variable exposed to containers |
| xdeploymentEnv | object | `{"ENV":"development","SG_ENV":"development","TZ":"Australia/Sydney"}` | xdeploymentEnv configmap values exposed as environment variables to PlaceOS containers |
| xdispatchSecrets | object | `{"SERVER_SECRET":"development"}` | dispatchSecrets secret values exposed as environment variables for the dispatch service |
| xdispatchSecrets.SERVER_SECRET | string | `"development"` | environment variable exposed to containers |
| xelasticClientEnv | object | `{"ES_HOST":"elasticsearch-master","ES_PORT":9200}` | xelasticClientEnv configmap values for ElasticSearch Service exposed as environment variables to PlaceOS containers |
| xetcdClientEnv | object | `{"ETCD_HOST":"etcd-headless","ETCD_PORT":2379}` | xetcdClientEnv configmap values for Etcd end point Service as environment variables to PlaceOS containers |
| xinitConfigEnv | object | `{"PLACE_APPLICATION":"backoffice","PLACE_AUTH_HOST":"auth:3000","PLACE_EMAIL":"support@place.tech","PLACE_TLS":true,"PLACE_USERNAME":"Place Support"}` | initConfigEnv configmap values for the initialisation job exposed as environment variables for the init subchart |
| xinitConfigEnv.PLACE_APPLICATION | string | `"backoffice"` | environment variable exposed to containers |
| xinitConfigEnv.PLACE_AUTH_HOST | string | `"auth:3000"` | environment variable exposed to containers |
| xinitConfigEnv.PLACE_EMAIL | string | `"support@place.tech"` | environment variable exposed to containers |
| xinitConfigEnv.PLACE_TLS | bool | `true` | environment variable exposed to containers |
| xinitConfigEnv.PLACE_USERNAME | string | `"Place Support"` | environment variable exposed to containers |
| xplaceLoaderClientEnv | object | `{"PLACE_LOADER_URI":"http://frontends:3000"}` | xplaceLoaderClientEnv configmap values for the frontend Service exposed as environment variables to PlaceOS containers |
| xplacePassword | string | `"development"` | xplacePassword. The value used by the init subchart to set the default domain users password |
| xredisClientEnv | object | `{"REDIS_URL":"redis://redis-headless:6379"}` | xredisClientEnv configmap values for the redis Service exposed as environment variables to PlaceOS containers |
| xrethinkdbClientEnv | object | `{"RETHINKDB_DB":"place_development","RETHINKDB_HOST":"rethinkdb-proxy","RETHINKDB_PORT":28015,"RETHINKDB_USER":"admin"}` | xrethinkdbClientEnv configmap values for RethinkDB Service exposed as environment variables to PlaceOS containers |
| xrethinkdbClientEnv.RETHINKDB_DB | string | `"place_development"` | environment variable exposed to containers |
| xrethinkdbClientEnv.RETHINKDB_HOST | string | `"rethinkdb-proxy"` | environment variable exposed to containers |
| xrethinkdbClientEnv.RETHINKDB_PORT | int | `28015` | environment variable exposed to containers |
| xrethinkdbClientEnv.RETHINKDB_USER | string | `"admin"` | environment variable exposed to containers |
| xrethinkdbClientSecrets | object | `{"RETHINKDB_PASSWORD":"password"}` | xrethinkdbClientSecrets secret values for the rethinkdb password exposed as environment variables to PlaceOS containers |
| xrethinkdbClientSecrets.RETHINKDB_PASSWORD | string | `"password"` | environment variable exposed to containers |
| xrethinkdbPassword | string | `"password"` | xrethinkdbPassword the admin password for RethinkDb. Used to set the admin password in RethinkDB if enabled then passed to multiple containers in a k8s secret |
| xrubberSoulClientEnv | object | `{"RUBBER_SOUL_URI":"http://rubbersoul:3000"}` | xrubberSoulClientEnv configmap values for the Rubber Soul service exposed as environment variables to PlaceOS containers |
| xrubberSoulClientEnv.RUBBER_SOUL_URI | string | `"http://rubbersoul:3000"` | environment variable exposed to containers |
| xserverSecret | string | `"development"` | xserverSecret for the dispatch service |
| xsmtpClientEnv | object | `{"SMTP_PORT":587,"SMTP_SECURE":"","SMTP_SERVER":"","SMTP_USER":""}` | xsmtpClientEnv configmap values for the SMTP server exposed as environment variables for the trigger service |
| xsmtpClientEnv.SMTP_PORT | int | `587` | environment variable exposed to containers |
| xsmtpClientEnv.SMTP_SECURE | string | `""` | environment variable exposed to containers |
| xsmtpClientEnv.SMTP_SERVER | string | `""` | environment variable exposed to containers |
| xsmtpClientEnv.SMTP_USER | string | `""` | environment variable exposed to containers |
| xsmtpClientSecrets | object | `{"SMTP_PASS":""}` | xsmtpClientSecrets secrets values exposed as environment variables for the trigger service |
| xsmtpClientSecrets.SMTP_PASS | string | `""` | environment variable exposed to containers |
| xsmtpPassword | string | `""` | xsmtpPassword. the smtp password used by triggers |
| xtz | string | `"Australia/Sydney"` | xtz the local time zone for the deployment |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.3.0](https://github.com/norwoodj/helm-docs/releases/v1.3.0)
