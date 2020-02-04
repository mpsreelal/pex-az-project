

# Network Module Output



output "ppdmz_vnet_name" {
	value = "${azurerm_virtual_network.dmz-vnet.name}"
}

output "ppdmz_gateway_subnet" {
	value = "${azurerm_subnet.GWsubnet-dmz.id}"
}

output "ppdmz_conf_subnet" {
	value = "${azurerm_subnet.PExipconference-dev-dmz.id}"
}
