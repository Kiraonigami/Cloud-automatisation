Le fichier yaml ansible a été modifier pour éviter d'afficher les clées secretes. Afin d'utiliser la commande ansible, utiliser cette commande:
ansible-playbook deploy-backend.yaml -i hosts --extra-vars "account_name=XXXXX access_key=XXXX"
Il faudra juste écrire yes pour que ansible se lance bien
route d upload: http://<IP>:3000/api/blob/upload 
