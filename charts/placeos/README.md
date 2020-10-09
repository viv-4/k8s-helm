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
| api.configmap.<< | object | `{"ES_HOST":"elasticsearch-master","ES_PORT":9200}` | Service Hosts |
| api.configmap.<< | object | `{"ENV":"development","SG_ENV":"development","TZ":"Australia/Sydney"}` | Environment |
| api.configmap.<<.ETCD_HOST | string | `"etcd-headless"` |  |
| api.configmap.<<.ETCD_PORT | int | `2379` |  |
| api.configmap.<<.PLACE_LOADER_URI | string | `"http://frontends:3000"` |  |
| api.configmap.<<.REDIS_URL | string | `"redis://redis-headless:6379"` |  |
| api.configmap.<<.RETHINKDB_DB | string | `"place_development"` |  |
| api.configmap.<<.RETHINKDB_HOST | string | `"rethinkdb-proxy"` |  |
| api.configmap.<<.RETHINKDB_PORT | int | `28015` |  |
| api.configmap.<<.RETHINKDB_USER | string | `"admin"` |  |
| api.configmap.<<.RUBBER_SOUL_URI | string | `"http://rubbersoul:3000"` |  |
| api.enabled | bool | `true` |  |
| api.fullnameOverride | string | `"api"` |  |
| api.secrets.<<.RETHINKDB_PASSWORD | string | `"password"` |  |
| auth | object | `{"configmap":{"<<":{"RETHINKDB_DB":"place_development","RETHINKDB_HOST":"rethinkdb-proxy","RETHINKDB_PORT":28015,"RETHINKDB_USER":"admin"},"COAUTH_NO_SSL":"true","TZ":"Australia/Sydney"},"enabled":true,"fullnameOverride":"auth","secrets":{"<<":{"RETHINKDB_PASSWORD":"password"}}}` | auth is the overide configuration for the embedded auth subchart |
| core | object | `{"configmap":{"<<":{"ENV":"development","SG_ENV":"development","TZ":"Australia/Sydney"}},"enabled":true,"fullnameOverride":"core","secrets":{"<<":{"RETHINKDB_PASSWORD":"password"}}}` | core is the overide configuration for the embedded core subchart |
| core.configmap.<< | object | `{"ENV":"development","SG_ENV":"development","TZ":"Australia/Sydney"}` | Environment |
| core.configmap.<< | object | `{"ETCD_HOST":"etcd-headless","ETCD_PORT":2379}` | Service Hosts |
| dispatch | object | `{"enabled":true,"fullnameOverride":"dispatch","secrets":{"<<":{"SERVER_SECRET":"development"}}}` | dispatch is the overide configuration for the embedded dispatch subchart |
| elasticsearch.coordinating.replicas | int | `0` |  |
| elasticsearch.data.replicas | int | `1` |  |
| elasticsearch.enabled | bool | `false` |  |
| elasticsearch.master.replicas | int | `1` |  |
| elasticsearch.templateOverrides | object | `{"elasticsearchMasterfullName":"elasticsearch-master"}` | templateOverrides. A work around to override the full name of the ElasticSearch master. See templates/_helpers.tpl |
| etcd.auth.rbac.enabled | bool | `false` |  |
| etcd.enabled | bool | `false` |  |
| etcd.fullnameOverride | string | `"etcd"` |  |
| frontends | object | `{"configmap":{"<<":{"ENV":"development","SG_ENV":"development","TZ":"Australia/Sydney"},"PLACE_LOADER_WWW":"www"},"enabled":true,"fullnameOverride":"frontends","httpSidecar":true,"secrets":{"<<":{"RETHINKDB_PASSWORD":"password"}}}` | frontends is the overide configuration for the embedded frontends subchart |
| frontends.configmap.<< | object | `{"ENV":"development","SG_ENV":"development","TZ":"Australia/Sydney"}` | Environment |
| global.customRedirectPort | string | `nil` | customRedirectPort the port the API and Frontend services are listening on. Leave as null if using standard ports. ie 80 or 443. -- Used by the init service to configure the appropriate services |
| global.placeDomain | string | `nil` |  |
| influxdb.enabled | bool | `false` |  |
| influxdb.fullnameOverride | string | `"influxdb"` |  |
| init | object | `{"config":{"<<":{"RETHINKDB_PASSWORD":"password"}},"enabled":true,"fullnameOverride":"init","secrets":{"PLACE_PASSWORD":"development"}}` | init is the overide configuration for the embedded init subchart |
| init.config.<< | object | `{"PLACE_APPLICATION":"backoffice","PLACE_AUTH_HOST":"auth:3000","PLACE_EMAIL":"support@place.tech","PLACE_TLS":true,"PLACE_USERNAME":"Place Support"}` | User/Application Configuration |
| init.config.<< | object | `{"ENV":"development","SG_ENV":"development","TZ":"Australia/Sydney"}` | Environment |
| init.config.<< | object | `{"RETHINKDB_DB":"place_development","RETHINKDB_HOST":"rethinkdb-proxy","RETHINKDB_PORT":28015,"RETHINKDB_USER":"admin"}` | Service Hosts |
| mosquitto.enabled | bool | `false` |  |
| mosquitto.fullnameOverride | string | `"mosquitto"` |  |
| redis.cluster.enabled | bool | `false` |  |
| redis.configmap | string | `"notify-keyspace-events Kg$"` |  |
| redis.enabled | bool | `false` |  |
| redis.fullnameOverride | string | `"redis"` |  |
| redis.usePassword | bool | `false` |  |
| rethinkdb.cluster.replicas | int | `1` |  |
| rethinkdb.enabled | bool | `false` |  |
| rethinkdb.rethinkdbPassword | string | `"password"` |  |
| rethinkdb.templateOverrides | object | `{"rethinkdbFullName":"rethinkdb"}` | templateOverrides. A work around to override the full name of the RethinkDb deployment. See templates/_helpers.tpl |
| rubbersoul | object | `{"configmap":{"<<":{"ENV":"development","SG_ENV":"development","TZ":"Australia/Sydney"}},"enabled":true,"fullnameOverride":"rubbersoul","secrets":{"<<":{"RETHINKDB_PASSWORD":"password"}}}` | rubbersoul is the overide configuration for the embedded rubber-soul subchart |
| rubbersoul.configmap.<< | object | `{"ENV":"development","SG_ENV":"development","TZ":"Australia/Sydney"}` | Environment |
| rubbersoul.configmap.<< | object | `{"RETHINKDB_DB":"place_development","RETHINKDB_HOST":"rethinkdb-proxy","RETHINKDB_PORT":28015,"RETHINKDB_USER":"admin"}` | Service Hosts |
| triggers | object | `{"configmap":{"<<":{"ENV":"development","SG_ENV":"development","TZ":"Australia/Sydney"}},"enabled":true,"fullnameOverride":"triggers","secrets":{"<<":{"SMTP_PASS":""}}}` | triggers is the overide configuration for the embedded triggers subchart |
| triggers.configmap.<< | object | `{"ETCD_HOST":"etcd-headless","ETCD_PORT":2379}` | Service Hosts |
| triggers.configmap.<< | object | `{"ENV":"development","SG_ENV":"development","TZ":"Australia/Sydney"}` | Environment |
| xdeploymentEnv | object | `{"ENV":"development","SG_ENV":"development","TZ":"Australia/Sydney"}` | xdeploymentEnv configmap values exposed as environment variables to PlaceOS containers |
| xdispatchSecrets | object | `{"SERVER_SECRET":"development"}` | dispatchSecrets secret values exposed as environment variables for the dispatch service |
| xelasticClientEnv | object | `{"ES_HOST":"elasticsearch-master","ES_PORT":9200}` | xelasticClientEnv configmap values for ElasticSearch Service exposed as environment variables to PlaceOS containers |
| xetcdClientEnv | object | `{"ETCD_HOST":"etcd-headless","ETCD_PORT":2379}` | xetcdClientEnv configmap values for Etcd end point Service as environment variables to PlaceOS containers |
| xinitConfigEnv | object | `{"PLACE_APPLICATION":"backoffice","PLACE_AUTH_HOST":"auth:3000","PLACE_EMAIL":"support@place.tech","PLACE_TLS":true,"PLACE_USERNAME":"Place Support"}` | initConfigEnv configmap values for the initialisation job exposed as environment variables for the init subchart |
| xplaceLoaderClientEnv | object | `{"PLACE_LOADER_URI":"http://frontends:3000"}` | xplaceLoaderClientEnv configmap values for the frontend Service exposed as environment variables to PlaceOS containers |
| xplacePassword | string | `"development"` | xplacePassword. The value used by the init subchart to set the default domain users password |
| xredisClientEnv | object | `{"REDIS_URL":"redis://redis-headless:6379"}` | xredisClientEnv configmap values for the redis Service exposed as environment variables to PlaceOS containers |
| xrethinkdbClientEnv | object | `{"RETHINKDB_DB":"place_development","RETHINKDB_HOST":"rethinkdb-proxy","RETHINKDB_PORT":28015,"RETHINKDB_USER":"admin"}` | xrethinkdbClientEnv configmap values for RethinkDB Service exposed as environment variables to PlaceOS containers |
| xrethinkdbClientSecrets | object | `{"RETHINKDB_PASSWORD":"password"}` | xrethinkdbClientSecrets secret values for the rethinkdb password exposed as environment variables to PlaceOS containers |
| xrethinkdbPassword | string | `"password"` | xrethinkdbPassword the admin password for RethinkDb. --  Used to set the admin password in RethinkDB if enabled then passed to multiple containers in a k8s secret |
| xrubberSoulClientEnv | object | `{"RUBBER_SOUL_URI":"http://rubbersoul:3000"}` | xrubberSoulClientEnv configmap values for the Rubber Soul service exposed as environment variables to PlaceOS containers |
| xserverSecret | string | `"development"` | xserverSecret for the dispatch service |
| xsmtpClientEnv | object | `{"SMTP_PORT":587,"SMTP_SECURE":"","SMTP_SERVER":"","SMTP_USER":""}` | xsmtpClientEnv configmap values for the SMTP server exposed as environment variables for the trigger service |
| xsmtpClientSecrets | object | `{"SMTP_PASS":""}` | xsmtpClientSecrets secrets values exposed as environment variables for the trigger service |
| xsmtpPassword | string | `""` | xsmtpPassword. the smtp password used by triggers |
| xtz | string | `"Australia/Sydney"` | xtz the local time zone for the deployment |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.3.0](https://github.com/norwoodj/helm-docs/releases/v1.3.0)
