# Jobs

---

## init

Run the init job to:
- Check for and perform required database migrations (recommended after each PlaceOS version update)

If required, a new PlaceOS `domain`, `user` & backoffice `application` can be created by setting these ENV variables on the pod:
- `PLACE_SKIP_PLACEHOLDERS: false`
- `PLACE_DOMAIN: ` domain to create

To run the init job:

1. Edit init.yaml
 - Set the `image` to the same PlaceOS version as deployed PlaceOS services
 - Set `PLACE_SKIP_PLACEHOLDERS` & `PLACE_DOMAIN` if required as above


2. Apply init.yaml (`namespace` may differ)
```
kubectl apply --filename init.yaml --namespace placeos
```

- The `init` pod logs will contain details about any migrations performed or entities created and will remain for 1 hour

---

## rethink-dump

Run the rethink-dump job to:
- Export the rethink database

To run the rethink-dump job:

1. Apply rethink-dump.yaml
```
kubectl apply --filename rethink-dump.yaml --namespace placeos
```

- The `rethink-dump` pod logs will contain output of the backup performed and output the kubectl command to copy it out of the cluster

---


## postgres-dump

Run the postgres-dump job to:
- Export the postgres database

To run the postgres-dump job:

1. Apply postgres-dump.yaml
```
kubectl apply --filename postgres-dump.yaml --namespace placeos
```

- The `postgres-dump` pod logs will output the kubectl command to copy it out of the cluster
- The dump will be created in the postgresql-0 pod in /tmp - bash into that pod to check if there are issues
