// Nombre del clúster AKS
output "aks_name" {
  value = azurerm_kubernetes_cluster.aks.name
}

// Kubeconfig del clúster AKS (sensible)
output "aks_kube_config" {
  value     = azurerm_kubernetes_cluster.aks.kube_config_raw
  sensitive = true
}

// URL del login server del ACR
output "acr_login_server" {
  value = azurerm_container_registry.acr.login_server
}

// Usuario admin del ACR
output "acr_admin_username" {
  value = azurerm_container_registry.acr.admin_username
}

// Contraseña admin del ACR (sensible)
output "acr_admin_password" {
  value     = azurerm_container_registry.acr.admin_password
  sensitive = true
}

// IP pública de la máquina virtual
output "vm_public_ip" {
  value = azurerm_public_ip.vm_ip.ip_address
}

// Clave privada SSH generada para la VM (sensible)
output "tls_private_key_ssh_key_private_key_pem" {
  value     = tls_private_key.ssh_key.private_key_pem
  sensitive = true
}

// dockerconfig.json codificado en base64 para autenticación con ACR (sensible)
output "acr_dockerconfigjson_b64" {
  value = base64encode(
    jsonencode({
      auths = {
        "${azurerm_container_registry.acr.login_server}" = {
          username = azurerm_container_registry.acr.admin_username
          password = azurerm_container_registry.acr.admin_password
          auth     = base64encode("${azurerm_container_registry.acr.admin_username}:${azurerm_container_registry.acr.admin_password}")
        }
      }
    })
  )
  sensitive = true
}
