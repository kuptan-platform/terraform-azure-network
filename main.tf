resource "azurerm_resource_group" "this" {
  name     = var.resource_group_name
  location = var.region
}

## module repo: https://github.com/Azure/terraform-azurerm-vnet
module "vnet" {
  source  = "Azure/vnet/azurerm"
  version = "4.0.0"

  use_for_each        = true
  resource_group_name = azurerm_resource_group.this.name
  vnet_name           = var.vnet_name
  vnet_location       = var.region
  address_space       = [var.vnet_cidr]
  subnet_names        = var.subnet_names
  subnet_prefixes     = var.subnet_cidrs

  tags = var.tags
}
