provider "azurerm" {
}

resource "azurerm_resource_group" "pexip_devstg_rg" {
  name     = "${var.azure_app_resourcegroup}"
  location = "${var.azure_location}"
tags {
    application = "pexip"
    project     = "pexip"
    environment = "${var.appenv}"
  }
}

module "networksecuritygroup" {
    source                      = "./networksecuritygroup"
    azure_location              = "${var.azure_location}"
    azure_app_resourcegroup     = "${var.azure_app_resourcegroup}"
    appenv                      = "${var.appenv}"
    dmz_subnet02_prefix         = "${var.dmz_subnet02_prefix}"
    #app_subnet03_prefix        = "${var.app_subnet03_prefix}"

}

module "network" {
    ###
    ###Pexip DevStg DMZ VNet
    ###
    source = "./network"
    azure_location = "${var.azure_location}"
    azure_app_resourcegroup = "${var.azure_app_resourcegroup}"
    appenv                  = "${var.appenv}"
    dmz_vnetname            = "${var.dmz_vnetname}"
    dmz_cidr_range          = "${var.dmz_cidr_range}"
    dmz_subnetname01        = "${var.dmz_subnetname01}"
    dmz_subnetname02        = "${var.dmz_subnetname02}"
    dmz_subnet01_prefix     =  "${var.dmz_subnet01_prefix}"
    dmz_subnet02_prefix     =  "${var.dmz_subnet02_prefix}"
    pxpconf_nsg             = "${module.networksecuritygroup.pxpconf_nsg}"
}
module "VnetGateway" {
    ###
    ### Virtual Network Gateway
    ###
    source = "./network/VnetGateway"
    azure_location = "${var.azure_location}"
    appenv                  = "${var.appenv}"
    azure_app_resourcegroup = "${var.azure_app_resourcegroup}"
    vnetgateway01        =  "${module.network.ppdmz_vnet_name}-GW"
    vnetgateway01_subnet = "${module.network.ppdmz_gateway_subnet}"
}

