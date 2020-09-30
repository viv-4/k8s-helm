# PlaceOS Charts Collection

A collection of charts for deploying PlaceOS into different environments.

Currently supported deployment scenarios are:

- Local deployment to a k3d cluster ( kubernetes in docker )
- GCP deployment to GKE
- Azure deployment to AKS

## Prerequisites

- helm v3 installed ( Tested with v3.3.1 )
- kubectl command line tool

For local deployments only

- docker daemon installed and running
- k3d installed see [K3D](https://k3d.io/).

Install third party resource dependencies

```sh

helm repo add halkeye https://halkeye.github.io/helm-charts/
helm repo add bitnami  https://charts.bitnami.com/bitnami
helm repo add stable https://kubernetes-charts.storage.googleapis.com/
helm repo add cnieg https://cnieg.github.io/helm-charts
cd charts/placeos
helm dependency update .

```

### Local Deployment with K3d

We use k3d in this example however it should work with any local k8s deployment assumimg you adjust your deployment for the exposed host and port mapping via the `global.domain` and `global.customRedirectPort`

K3S is a lightweight distribution of kubernetes by Rancher. [K3D](https://k3d.io/) is a utility to deploy a k3s cluster as docker containers.

For local deployment create and start the k3s cluster and map port 8443 on localhost to the k3s ingress loadbalancer.

```sh
k3d cluster create --agents 3 -p 8443:443@loadbalancer  --update-default-kubeconfig
# or if connecting to a previously created default k3s cluster
kubectl config set current-context  k3d-k3s-default

```

Deploy the placeos charts to the local cluster

```sh
cd charts/

helm install dev -f placeos/values-local.yaml  placeos/

# the cluster will be available at https://localhost:8443/backoffice
```

Delete the chart and resource

```sh
helm uninstall dev
```

### GCP / Azure Deployment

Read and complete the instructions in the k8s-terraform repository

The gcp folder includes.

- deploying GKE
- deploying a public ingress

The azure folder includes.

- deploying AKS
- deploying a public ingress

If no ingress has been deployed yet ( works for both Azure and GCP ):

```sh
## Install Load Balancer. See https://hub.helm.sh/charts/ingress-nginx/ingress-nginx
helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
helm install placeos -n ingress-nginx --create-namespace  ingress-nginx/ingress-nginx

```

Extract the public IP of the Loadbalancer

```sh
export PLACE_DOMAIN=$(kubectl get svc -n ingress-nginx placeos-ingress-nginx-controller -o=jsonpath='{.status.loadBalancer.ingress[*].ip}')
```

Deploy the charts:

```sh
cd charts/

# For GCP
helm install dev placeos/ -f placeos/values-gcp.yaml --set global.placeDomain="${PLACE_DOMAIN}.xip.io"

# For Azure
helm install dev placeos/ -f placeos/values-azure.yaml --set global.placeDomain="${PLACE_DOMAIN}.xip.io"

```

**Note**: we use xip.io for a ready made domain for development and demonstration purposes.

The user interface should be available after a while at `${PLACE_DOMAIN}.xip.io`

## Known Issues

When destroying a stateful set PVCs and the underlying PVs are not deleted. Consequently any configuration stored on file in a PV will be retained when the deployments are deleted and redeployed as in a development scenario, ( ie helm install > helm uninstall > helm install ).

Because configurations such as the Etcd master password is randomly generated redeploying will generate a new password as a secret which will not match the secret stored in the etcd PV and the deployment will fail

ElasticSearch returns an error:
> max file descriptors [###] for elasticsearch process is too low, increase to at least [65535]

Possible Solutions:

1. Ensure the docker daemon user is running with a `ulimit -n` of at least `65535`
2. Add or modify following to docker daemon start command ( Dont do this in production! )

```sh
--default-ulimit nofile=65535:65535

```
