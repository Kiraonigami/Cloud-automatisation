Le fichier yaml ansible a été modifier pour éviter d'afficher les clées secretes. Afin d'utiliser la commande ansible, utiliser cette commande:
ansible-playbook deploy-backend.yaml -i hosts --extra-vars "account_name=XXXXX access_key=XXXX"
