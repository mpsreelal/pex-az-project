

resource "azurerm_public_ip" "PPAppspubIP" {
	count = 1
	name = "PPApps2-GWPubIP-westus2-${count.index}"
	location = "${var.azure_location}"
	resource_group_name = "${var.azure_app_resourcegroup}"
	allocation_method = "Dynamic"
	tags {
    	application = "pexip-teams"
    	project     = "pexip"
    	environment = "${var.appenv}"
    }
 }
