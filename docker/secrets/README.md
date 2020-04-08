## Encode
Encode the password with base64

```bash
echo 'my_password_here' | base64
```
## Deploy

```bash
# initialize
terraform init

# validate
terraform validate

# plan
terraform plan

# deploy
terraform apply --auto-approve
```
## Validate

```bash
# grab container ID for docker
docker ps

# exec into container
docker exec -it my_cont_id /bin/bash

# use the unencrypted password
mysql -uroot -p
```

## Destroy

```bash
# ensure the resources are right
terraform state list

# DRY RUN destroy, see what will be destroyed
terraform plan -destroy

# destroy
terraform destroy
```