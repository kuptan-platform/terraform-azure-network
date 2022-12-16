variable "resource_group_name" {
  description = "The resource group name"
  type        = string
}

variable "region" {
  description = "The region under which the resources will be created"
  type        = string
}

variable "vnet_cidrs" {
  description = "The virtual network cidr block(s)"
  type        = list(string)
}

variable "vnet_name" {
  description = "The virtual network name"
  type        = string
}

## OPTIONAL ##
variable "subnet_names" {
  description = "A list of subnet names"
  type        = list(string)

  default = []
}

variable "subnet_cidrs" {
  description = "A list of subnet cidr blocks"
  type        = list(string)

  default = []
}

variable "tags" {
  description = "Labels to tag the resources"
  type        = map(string)

  default = {}
}