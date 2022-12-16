resource "azurerm_resource_group" "this" {
  name     = var.resource_group_name
  location = var.region
}

## module repo: https://github.com/Azure/terraform-azurerm-vnet
module "vnet" {
  source  = "Azure/vnet/azurerm"
  version = "3.2.0"

  resource_group_name = azurerm_resource_group.this.name
  vnet_location       = var.region
  use_for_each        = true
  address_space       = var.vnet_cidrs
  subnet_names        = var.subnet_names
  subnet_prefixes     = var.subnet_cidrs

  tags = var.tags
}
