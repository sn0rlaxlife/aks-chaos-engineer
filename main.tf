terraform {
  required_version = ">=1.3"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0, < 4.0"
    }
    kubectl = {
      source  = "gavinbunney/kubectl"
      version = "1.14.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "2.10.1"
    }
  }
}
provider "azurerm" {
  features {
    key_vault {
      purge_soft_delete_on_destroy    = true
      recover_soft_deleted_key_vaults = true
      }
  }

}

provider "kubectl" {
  config_path = "~/.kube/config"
}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
}
}
resource "azurerm_resource_group" "aks" {
  name     = "aks-chaos-mesh-rg"
  location = "East US"
}

#creates a vnet/subnet with the ability to use the mapping as shown see ref https://registry.terraform.io/modules/Azure/subnets/azurerm/latest
module "aks-vnet" {
  source              = "Azure/subnets/azurerm"
  version             = "1.0.0"
  resource_group_name = azurerm_resource_group.aks.name
  subnets = {
    subnet0 = {
      address_prefixes = ["10.52.0.0/24"]
    }
  }
  virtual_network_address_space = ["10.52.0.0/16"]
  virtual_network_location      = var.region
  virtual_network_name          = "aks-chaos-vnet"
}

module "aks-vnet2" {
  source              = "Azure/subnets/azurerm"
  version             = "1.0.0"
  resource_group_name = azurerm_resource_group.aks.name
  subnets = {
    subnet0 = {
      address_prefixes = ["10.0.0.0/24"]
    }
  }
  virtual_network_address_space = ["10.0.0.0/16"]
  virtual_network_location      = var.region
  virtual_network_name          = "aks-chaos-vnet2"
}
