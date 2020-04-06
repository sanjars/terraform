## Deploy

terraform init

terraform plan -var "ext_port=8082"

terraform apply --auto-approve -var "ext_port=8082"

## Verify

docker volume inspect mysql_data

ls /var/lib/docker/volumes/mysql_data/_data