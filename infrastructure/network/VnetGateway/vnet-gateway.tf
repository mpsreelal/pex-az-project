
resource azurerm_virtual_network_gateway "PPdmz01" {
	name 				= "${var.vnetgateway01}"
	location 			= "${var.azure_location}"
	resource_group_name = "${var.azure_app_resourcegroup}"
	type 				= "Vpn"
	vpn_type 			= "RouteBased"
	sku 				= "VpnGw1"
	ip_configuration {
		name 							= "${var.vnetgateway01}-config"
		public_ip_address_id 			= "${element(azurerm_public_ip.PPAppspubIP.*.id, 1)}"
		private_ip_address_allocation 	= "Dynamic"
		subnet_id 						= "${var.vnetgateway01_subnet}"
	}
	tags {
    	application = "pexip-conference"
    	project     = "pexip"
    	environment = "${var.appenv}"
    }
}