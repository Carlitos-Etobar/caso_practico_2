// Recurso principal para crear el clúster de Kubernetes (AKS) en Azure
resource "azurerm_kubernetes_cluster" "aks" {
  name                = "cp2-aks"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  dns_prefix          = "cp2-aks"

  // Nodo por defecto del clúster
  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_B2s"
  }

  // Identidad administrada para el clúster (necesaria para permisos en otros recursos)
  identity {
    type = "SystemAssigned"
  }

  tags = {
    environment = "casopractico2"
  }
}

// Asigna el rol 'AcrPull' al AKS para que pueda extraer imágenes del ACR
resource "azurerm_role_assignment" "acr_pull" {
  principal_id         = azurerm_kubernetes_cluster.aks.identity[0].principal_id
  role_definition_name = "AcrPull"
  scope                = azurerm_container_registry.acr.id
}
