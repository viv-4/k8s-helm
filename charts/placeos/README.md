### dependency build

```sh

helm repo add halkeye https://halkeye.github.io/helm-charts/
helm repo add bitnami  https://charts.bitnami.com/bitnami
helm repo add stable https://kubernetes-charts.storage.googleapis.com/
helm repo add cnieg https://cnieg.github.io/helm-charts

helm dependency update [chart root folder]

```

### Cluster set up

For local development:

```sh
k3d cluster create --agents 3 -p 8443:443@loadbalancer  --update-default-kubeconfig


helm install dev placeos/

# cluster will be available at https://localhost:8443
helm upgrade dev placeos/
helm uninstall dev
```

# Known Issues

Etcd password is randomly generated
helm uninstall does not remove the pvc and the password remains set in the store.
If redeploying with the same name a new password will be generated as a secret which will not match the secret stored in etcd and the deployment will fail

EsasticSearch
max file descriptors [1024] for elasticsearch process is too low, increase to at least [65535]

Ensure the docker daemon user is running with a `ulimit -n` of at least `65535`
Add or modify following to docker daemon start command

```sh

--default-ulimit nofile=65535:65535

```

```



```

# Supporting Service Endpoint Names
