
###
#### Creates Dev DMZ VNet
###
resource "azurerm_virtual_network" "dmz-vnet" {
	name = "${var.dmz_vnetname}"
	resource_group_name = "${var.azure_app_resourcegroup}"
	location = "${var.azure_location}"
	address_space = "${var.dmz_cidr_range}"
tags {
    application = "pexip-conference"
    project     = "pexip"
    environment = "${var.appenv}"
  }
}
###
#### Creates gateway subnet for Dev 
###
resource "azurerm_subnet" "GWsubnet-dmz" {
	name = "${var.dmz_subnetname01}"
	resource_group_name = "${var.azure_app_resourcegroup}"
	virtual_network_name = "${azurerm_virtual_network.dmz-vnet.name}"
	address_prefix = "${var.dmz_subnet01_prefix}"
}
resource "azurerm_subnet" "PExipconference-dev-dmz" {
	name = "${var.dmz_subnetname02}"
	resource_group_name = "${var.azure_app_resourcegroup}"
	virtual_network_name = "${azurerm_virtual_network.dmz-vnet.name}"
	address_prefix = "${var.dmz_subnet02_prefix}"
	#network_security_group_id = "${var.pxpconf_nsg}"
	service_endpoints = [ "Microsoft.Storage" ]
}



