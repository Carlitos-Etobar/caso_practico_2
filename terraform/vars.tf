variable "location" {
  default     = "westeurope"
  description = "Ubicación de los recursos en Azure"
}

variable "resource_group_name" {
  default     = "rg-casopractico2"
  description = "Nombre del grupo de recursos"
}

variable "acr_name" {
  default     = "acrpractico2demo"
  description = "Nombre del container registry"
}
