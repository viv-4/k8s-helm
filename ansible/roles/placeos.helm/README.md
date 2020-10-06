placeos.helm
=========

A brief description of the role placeos.helm goes here.

Requirements
------------

Any prerequisites that may not be covered by Ansible itself or the role should
be mentioned here. For instance, if the role uses the EC2 module, it may be a
good idea to mention in this section that the boto package is required.

Role Variables
--------------

A description of the settable variables for this role should go here, including
any variables that are in defaults/main.yml, vars/main.yml, and any variables
that can/should be set via parameters to the role. Any variables that are read
from other roles and/or the global scope (ie. hostvars, group vars, etc.) should
be mentioned here as well.

| Variable | Description | Defaut Value |
| -------- | ----------- | ------------ |
|          |             |              |
|          |             |              |
|          |             |              |

Role Configuration
--------------

The default configuration may be overwritten through the use of `host_vars`and or `group_vars` files.

default role configuration file: `/defaults/main.yml`

| Variable | Description | Defaut Value |
| -------- | ----------- | ------------ |
|          |             |              |
|          |             |              |
|          |             |              |

------------

Dependencies
------------

A list of other roles hosted on Galaxy should go here, plus any details in
regards to parameters that may need to be set for other roles, or variables that
are used from other roles.

Example Playbook
----------------

Including an example of how to use your role and include all variables:

```yaml
---
- hosts: localhost
  vars:
    # a-role-vars vars
    var1: someval
    var2: someval
    var3: someval
    var4: someval

    # this-role vars
    var5: someval
    var6: someval

  roles:
    # a pre-requisite role
    - { role: a-role }
    # this role
    - { role: this-role }
  environment:
    # environment variables
    AWS_REGION: "ap-southeast-2"
```

License
-------

Apache 2

Author Information
------------------

Deloitte PE