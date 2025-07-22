// Recurso para la red virtual de Azure donde se desplegarán los distintos recursos
resource "azurerm_virtual_network" "vm_vnet" {
  name                = "vnet-casopractico2"
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = ["10.0.0.0/16"]

  tags = {
    environment = "casopractico2"
  }
}

// Recurso para la subred dentro de la red virtual
resource "azurerm_subnet" "vm_subnet" {
  name                 = "subnet-casopractico2"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vm_vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

// Recurso para la IP pública asociada a la máquina virtual
resource "azurerm_public_ip" "vm_ip" {
  name                = "ip-casopractico2"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
  sku                 = "Standard"
  ip_version          = "IPv4"

  tags = {
    environment = "casopractico2"
  }
}

// Recurso para generar una clave SSH privada para acceso a la VM
resource "tls_private_key" "ssh_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}
