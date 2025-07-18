variable "location" {
  default = "France Central"
}

variable "resource_group_name" {
  default = "projet-rg-SBO"
}

variable "vm_name" {
  type    = string
  default = "vm-exo-SBO"
}

variable "admin_username" {
  type    = string
  default = "azureuser"
}

variable "vm_size" {
  type    = string
  default = "Standard_B1s"
}
