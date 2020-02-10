### Network Module Variables
variable "azure_app_resourcegroup" {
}

variable "azure_location" {
}

variable "appenv" {
}

#################################
### Application DMZ VNet
#################################
variable "dmz_vnetname" {
}

variable "dmz_cidr_range" {}

variable "dmz_subnetname01" {
}

variable "dmz_subnetname02" {
}

#variable "dmz_subnetname03" {}
variable "dmz_subnet01_prefix" {
}

variable "dmz_subnet02_prefix" {
}

#################################
### Virtual Network Gateway Variables
#################################
#variable "vnetgateway03" {}
variable "dmz_securitygroup_name" {}
variable "project_name" {}
variable "Allowed-Subnet" {}
variable "azFWpublicIP_name" {}
variable "azFWname" {}
variable "azFWconf" {}
