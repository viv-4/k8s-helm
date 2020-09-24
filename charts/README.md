# PlaceOS Charts Collection

A collection of charts for deploying PlaceOS into different environments.

Currently supported deployment scenarios are:

- Local deployment to a k3d cluster ( kubernetes in docker )
- GCP deployment to GKE

## Prerequisites

- helm v3 installed
- kubectl command line tool
- docker daemon installed and running ( for local deployments only )

```sh

helm repo add halkeye https://halkeye.github.io/helm-charts/
helm repo add bitnami  https://charts.bitnami.com/bitnami
helm repo add stable https://kubernetes-charts.storage.googleapis.com/
helm repo add cnieg https://cnieg.github.io/helm-charts

helm dependency update [chart root folder]

```

### Local Deployment

For local development:

```sh
k3d cluster create --agents 3 -p 8443:443@loadbalancer  --update-default-kubeconfig
# or for an existing cluster
kubectl config set current-context  k3d-k3s-default

```

Install the chart

```sh
cd charts/

helm install RELEASE_NAME placeos/

# cluster will be available at https://localhost:8443
helm upgrade dev placeos/
helm uninstall dev
```

### GCP Deployment

Read and complete the instructions in the k8s-terraform repository gcp folder which includes.

- deploying GKE
- deploying a public ingress


```
cd charts/
export PLACE_DOMAIN=$(kubectl get svc -n ingress-nginx place-os-ingress-nginx-controller -o=jsonpath='{.status.loadBalancer.ingress[*].ip}')
helm install dev placeos/ -f placeos/values-gcp.yaml --set global.placeDomain="${PLACE_DOMAIN}.xip.io"

```

The user interface should be available after a while at `${PLACE_DOMAIN}.xip.io`

## Known Issues

When destroying a stateful set PVCs and PVs are not deleted. Consequently any configuration stored on file in a PV will be retained when the deployments are deleted and re-added as in a development scenario, ( ie helm install > helm uninstall > helm install ).

Because configurations such as the Etcd master password is randomly generated redeploying will generate a new password as a secret which will not match the secret stored in the etcd PV and the deployment will fail

ElasticSearch returns an error:
> max file descriptors [###] for elasticsearch process is too low, increase to at least [65535]

Possible Solutions:

1. Ensure the docker daemon user is running with a `ulimit -n` of at least `65535`
2. Add or modify following to docker daemon start command ( Dont do this in production! )

```sh
--default-ulimit nofile=65535:65535

```
