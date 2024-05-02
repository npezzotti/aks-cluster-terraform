locals {
  common_tags = {
    Env = "Development"
  }
}

data "azuread_client_config" "current" {}

resource "random_pet" "main" {
  length = 2
}

resource "azurerm_resource_group" "main" {
  location = var.location
  name     = random_pet.main.id
}

resource "azurerm_kubernetes_cluster" "main" {
  location            = var.location
  name                = random_pet.main.id
  resource_group_name = azurerm_resource_group.main.name
  dns_prefix          = random_pet.main.id

  default_node_pool {
    name       = "defaultpool"
    vm_size    = "Standard_D4_v2"
    temporary_name_for_rotation = "temp"
    node_count = var.node_count
  }

  linux_profile {
    admin_username = "ubuntu"

    ssh_key {
      key_data = file(var.ssh_key)
    }
  }

  identity {
    type = "SystemAssigned"
  }

  tags = merge(local.common_tags, {
    Name = "${random_pet.main.id}-cluster"
  })
}
