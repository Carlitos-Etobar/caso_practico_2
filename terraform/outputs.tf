output "acr_login_server" {
  value = azurerm_container_registry.acr.login_server
}

output "acr_admin_username" {
  value = azurerm_container_registry.acr.admin_username
}

output "acr_admin_password" {
  value     = azurerm_container_registry.acr.admin_password
  sensitive = true
}

output "vm_public_ip" {
  value = azurerm_public_ip.vm_ip.ip_address
}

output "tls_private_key_ssh_key_private_key_pem" {
  value     = tls_private_key.ssh_key.private_key_pem
  sensitive = true
}
