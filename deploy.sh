#!/bin/bash

set -e

echo "Initialisation et application Terraform..."
terraform init
terraform apply -auto-approve

echo "Récupération de l'adresse IP publique de la VM..."
VM_IP=$(terraform output -raw public_ip_address)

echo "Mise à jour du fichier ansible/hosts..."
cat <<EOF > ansible/hosts
[azure]
$VM_IP ansible_user=azureuser ansible_ssh_private_key_file=~/.ssh/id_rsa
EOF

echo "Récupération des infos de stockage..."
STORAGE_NAME=$(terraform output -raw storage_account_name)
ACCESS_KEY=$(terraform output -raw storage_account_access_key)

echo "Lancement du playbook Ansible..."
ansible-playbook ansible/deploy-backend.yaml \
  -i ansible/hosts \
  --extra-vars "storage_name=$STORAGE_NAME access_key=$ACCESS_KEY"

echo "Déploiement terminé avec succès."
