# Example PlaceOS Complex Deployment

Example provisioning PlaceOS and third party helm charts in a more "production like" deployment using Ansible.

## Prerequisites

- Ansible >= 2.9 on Python 3

- Review the requirements for the [Ansible helm wrapper](https://docs.ansible.com/ansible/2.10/collections/community/kubernetes/helm_module.html)

- openshift python library. To install `pip install openshift`

- Install the community.kubernetes Ansible collection: `ansible-galaxy collection install community.kubernetes`

tested with community.kubernetes:1.0.0

## Executing

To deploy:

```sh
# Local deployment to k3d
# Check first be for deploying
ansible-playbook placeos-k3d.yaml -i inventories/k8s/ --check
ansible-playbook placeos-k3d.yaml -i inventories/k8s/

# GKE deployment
ansible-playbook placeos-gke.yaml -i inventories/k8s/  --check
ansible-playbook placeos-gke.yaml -i inventories/k8s/

# AKS deployment
ansible-playbook placeos-aks.yaml -i inventories/k8s/  --check
ansible-playbook placeos-aks.yaml -i inventories/k8s/

```

To cleanup:

```sh
ansible-playbook placeos-k3d.yaml -i inventories/k8s/ -e "chart_state=absent"

```
