# Example PlaceOS Complex Deployment

Example provisioning PlaceOS and third party helm charts in a more "production like" deployment.

## Prerequisites

- Ansible >= 2.9 on Python 3

- Review the requirements for the [Ansible helm wrapper](https://docs.ansible.com/ansible/2.10/collections/community/kubernetes/helm_module.html)

- Install the community.kubernetes Ansible collection: `ansible-galaxy collection install community.kubernetes`

tested with community.kubernetes:1.0.0

## Executing

To deploy:

```sh
ansible-playbook playbook.yaml

```

To cleanup:

```sh
ansible-playbook playbook.yaml -e "chart_state=absent"

```
