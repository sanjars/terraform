## Deploy

```bash
terraform init
```

```bash
terraform plan -var "ext_port=8082"
```

```bash
terraform apply --auto-approve -var "ext_port=8082"
```

## Verify

```bash
docker service ls
```

```bash
docker container ls
```

```bash
docker ps
```

**Note!** You should see only one container, and that is normal because there are 2 containers and each container is running in 2 different hosts.