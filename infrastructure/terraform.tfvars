### Terraform TFvars
project_name = "TPX-Development"
### Azure Resource Group Variables
azure_location = "westus2"
azure_app_resourcegroup = "PreProdStg-Pexip-westus2-RG"
appenv = "devstage"

### Network Module Variables

###
### Pexip DMZ VNet for DevStage environment
###
dmz_vnetname = "PPdmz2-westus2"
dmz_cidr_range = [ "10.221.40.0/25" ]
dmz_subnetname01 = "GatewaySubnet"
dmz_subnetname02 = "DevDmzApps"
dmz_subnet01_prefix =  "10.221.40.96/27"
dmz_subnet02_prefix =  "10.221.40.0/27"
dmz_securitygroup_name =  "pexip-dmz-westus2-nsg"



### Firewall Module Values
Allowed-Subnet = "10.221.38.0/23"
#aZFWPublicIpId = "${azurerm_public_ip.FWpublicip.id}"
azFWpublicIP_name = "DMZpublicIPpexip"
azFWname = "DMZfirewall-westus2-"
azFWconf = "DMZ-Firewall-configuration-westus2"

