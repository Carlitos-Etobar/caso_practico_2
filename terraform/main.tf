// Proveedor de Azure Resource Manager
provider "azurerm" {
  features {}
}

// Recurso para crear el grupo de recursos principal en Azure
resource "azurerm_resource_group" "main" {
  name     = var.resource_group_name  // Nombre del grupo de recursos, tomado de variables
  location = var.location             // Ubicación del grupo de recursos, tomada de variables

  tags = {
    environment = "casopractico2"     // Etiqueta para identificar el entorno
  }
}
