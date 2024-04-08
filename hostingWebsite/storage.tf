
resource "azurerm_storage_account" "storageAccount" {
  name                = "storageportfolio2"
  resource_group_name = azurerm_resource_group.resourceGroup.name
  location            = azurerm_resource_group.resourceGroup.location

  account_tier             = "Standard"
  account_replication_type = "LRS"
  account_kind             = "StorageV2"

  enable_https_traffic_only = true

  static_website {
    index_document = "index.html"
  }
}

resource "azurerm_storage_blob" "storageBlob" {
  name                   = "index.html"
  storage_account_name   = azurerm_storage_account.storageAccount.name
  storage_container_name = "$web"
  type                   = "Block"
  content_type           = "text/html"
  source                 = "index.html"
}

resource "null_resource" "generateInventory" {
  provisioner "local-exec" {
    command = <<EOT
cat << EOF > inventory.yml

[storage]
${azurerm_storage_account.storageAccount.name} ansible_connection=local

[storage:vars]
storage_account_name= ${azurerm_storage_account.storageAccount.name}
storage_container_name= ${azurerm_storage_blob.storageBlob.storage_container_name}

EOF
EOT
  }
}