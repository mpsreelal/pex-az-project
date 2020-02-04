### Networking Module Variables
variable "azure_app_resourcegroup" {}
variable "azure_location" {}
variable "appenv" {}

#################################
### Application DEV DMZ VNet
#################################
variable "dmz_vnetname" {}
variable "dmz_cidr_range" {
	type = "list"
}
variable "dmz_subnetname01" {}
variable "dmz_subnetname02" {}
variable "dmz_subnet01_prefix" {}
variable "dmz_subnet02_prefix" {}
variable "pxpconf_nsg" {}
