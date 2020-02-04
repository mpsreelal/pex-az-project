
###
### Pexip Dev Virtual Networks hosting development/stage conference nodes
###
output "ppdmz_vnet_name" {
	value = "${module.network.ppdmz_vnet_name}"
}
###
### Pexip Dev DMZ Subnets
###
output "ppdmz_conf_subnet" {
	value = "${module.network.ppdmz_conf_subnet}"
}

output "ppdmz_gateway_subnet" {
	value = "${module.network.ppdmz_gateway_subnet}"
}
###
### Output from network security group module
###
output "pxpconf_nsg" {
	value = "${module.networksecuritygroup.pxpconf_nsg}"
}
