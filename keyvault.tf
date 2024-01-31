data "azurerm_client_config" "current" {}


resource "azurerm_key_vault" "aks-istio" {
    name                        = "aks-istiokv"
    location                    = "East US"
    resource_group_name         = azurerm_resource_group.aks.name
    enabled_for_deployment      = true
    tenant_id                   = data.azurerm_client_config.current.tenant_id
    soft_delete_retention_days  = 7
    purge_protection_enabled    = true

    sku_name = "standard"

    access_policy {
        tenant_id = data.azurerm_client_config.current.tenant_id
        object_id = data.azurerm_client_config.current.object_id

        key_permissions = [
            "get",
            "list",
            "create",
            "delete",
            "purge",
            "recover",
            "backup",
            "restore",
        ]

        secret_permissions = [
            "get",
            "list",
            "set",
            "delete",
            "purge",
            "recover",
            "backup",
            "restore",
        ]

        storage_permissions = [
            "get",
            "list",
            "delete",
            "set",
            "update",
            "regeneratekey",
            "recover",
            "purge",
            "backup",
            "restore",
        ]

        certificate_permissions = [
            "get",
            "list",
            "delete",
            "create",
            "import",
            "update",
            "managecontacts",
            "getissuers",
            "listissuers",
            "setissuers",
            "deleteissuers",
            "manageissuers",
            "recover",
            "purge",
            "backup",
            "restore",
        ]
    }
    
}