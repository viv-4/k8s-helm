# Example PlaceOS Complex Deployment

Example provisioning PlaceOS and third party helm charts in a more "production like" deployment using Ansible.

## Prerequisites

- Ansible >= 2.9 on Python 3

- Openshift python library. To install `pip install openshift`

- Review the requirements for the [Ansible helm wrapper](https://docs.ansible.com/ansible/2.10/collections/community/kubernetes/helm_module.html)

- Install the community.kubernetes Ansible collection: `ansible-galaxy collection install community.kubernetes`

tested with community.kubernetes:1.0.0

## Executing

To deploy:

```sh
# Local deployment to k3d
# Check first be for deploying
ansible-playbook placeos.yaml -i inventories/k3d/ --check
ansible-playbook placeos.yaml -i inventories/k3d/

# GKE deployment
ansible-playbook placeos.yaml -i inventories/gke/  --check
ansible-playbook placeos.yaml -i inventories/gke/

# AKS deployment
ansible-playbook placeos.yaml -i inventories/aks/  --check
ansible-playbook placeos.yaml -i inventories/aks/

```

To cleanup:

```sh
ansible-playbook placeos.yaml -i inventories/k3d/ -e "chart_state=absent"
ansible-playbook placeos.yaml -i inventories/aks/ -e "chart_state=absent"
ansible-playbook placeos.yaml -i inventories/gke/ -e "chart_state=absent"

```
