#!/bin/bash

set -e

echo "Lancement de Terraform..."
terraform init
terraform apply -auto-approve

echo "Récupération des infos de stockage..."
STORAGE_NAME=$(terraform output -raw storage_account_name)
ACCESS_KEY=$(terraform output -raw storage_account_access_key)

echo "Lancement du playbook Ansible..."
ansible-playbook ansible/deploy-backend.yaml \
  -i ansible/hosts \
  --extra-vars "storage_name=$STORAGE_NAME access_key=$ACCESS_KEY"
