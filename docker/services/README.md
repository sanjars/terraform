## Deploy

`terraform init`

`terraform plan -var "ext_port=8082"`

`terraform apply --auto-approve -var "ext_port=8082"`

## Verify

`docker service ls`

`docker container ls`

You should see only one container, and that is normal because there are 2 containers and each container is running in 2 different hosts.

`docker ps`
