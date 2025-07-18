output "public_ip_address" {
  value = azurerm_public_ip.public_ip.ip_address
}

output "vm_name" {
  value = azurerm_linux_virtual_machine.vm.name
}

output "storage_account_name" {
  value = azurerm_storage_account.storage.name
}

output "storage_account_access_key" {
  value       = azurerm_storage_account.storage.primary_access_key
  sensitive   = true
  description = "Clé d'accès principale du compte de stockage"
}

output "ssh_command" {
  value = "ssh -i ~/.ssh/id_rsa azureuser@${azurerm_public_ip.public_ip.ip_address}"
}

