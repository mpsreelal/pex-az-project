resource "azurerm_network_security_group" "pxpconfnsg" {
	name 					= "pexip-conf-dev-westus2-NSG"
	resource_group_name     = "${var.azure_app_resourcegroup}"
 	location 				= "${var.azure_location}"

###
### Inbound Rules for Conferencing Nodes
###
 security_rule {
    name                       = "allow-SSH"
    description				   = "Permit Access to SSH"
    priority                   = "100"
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefixes      = [ "10.221.38.0/27","10.245.16.0/27","10.245.33.0/24","10.245.32.0/24","173.224.165.7" ]
    destination_address_prefixes = [ "10.221.40.0/27", "10.245.240.0/27" ]
  }
 security_rule {
    name                       = "allow-https"
    description				   = "Permit Access to Https"
    priority                   = "105"
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "443"
    source_address_prefix      = "*"
    destination_address_prefixes = [ "${var.dmz_subnet02_prefix}", "10.245.240.0/27" ]
  }

  security_rule {
    name                       = "allow-http"
    description				   = "Permit Access to Http"
    priority                   = "110"
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefixes = [ "${var.dmz_subnet02_prefix}", "10.245.240.0/27" ]
  }
  security_rule {
    name                       = "allow-h323cs"
    description				   = "Permit Access to H.323 CS"
    priority                   = "115"
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "1720"
    source_address_prefix      = "*"
    destination_address_prefixes = [ "${var.dmz_subnet02_prefix}", "10.245.240.0/27" ]
  }
  security_rule {
    name                       = "allow_sip_tcp"
    description				   = "Permit Access to SIP TCP"
    priority                   = "120"
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "5060"
    source_address_prefix      = "*"
    destination_address_prefixes = [ "${var.dmz_subnet02_prefix}", "10.245.240.0/27" ]
  }
  security_rule {
    name                       = "allow_sip_tls"
    description				   = "Permit Access to SIP TLS"
    priority                   = "125"
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "5061"
    source_address_prefix      = "*"
    destination_address_prefixes = [ "${var.dmz_subnet02_prefix}", "10.245.240.0/27" ]
  }
  security_rule {
    name                       = "allow_signalling_tcp"
    description				   = "Permit access to ephemeral TCP call signalling ports"
    priority                   = "130"
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "33000-39999"
    source_address_prefix      = "*"
    destination_address_prefixes = [ "${var.dmz_subnet02_prefix}", "10.245.240.0/27" ]
  }
  security_rule {
    name                       = "allow_media_tcp"
    description				   = "Permit access to ephemeral TCP media ports"
    priority                   = "135"
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "40000-49999"
    source_address_prefix      = "*"
    destination_address_prefixes = [ "${var.dmz_subnet02_prefix}", "10.245.240.0/27" ]
  }
  security_rule {
    name                       = "allow_h323ls"
    description				   = "Permit access to H.323 LS"
    priority                   = "140"
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Udp"
    source_port_range          = "*"
    destination_port_range     = "1719"
    source_address_prefix      = "*"
    destination_address_prefixes = [ "${var.dmz_subnet02_prefix}", "10.245.240.0/27" ]
  }
  security_rule {
    name                       = "allow_signalling_udp"
    description				   = "Permit access to ephemeral UDP call signalling ports"
    priority                   = "150"
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Udp"
    source_port_range          = "*"
    destination_port_range     = "33000-39999"
    source_address_prefix      = "*"
    destination_address_prefixes = [ "${var.dmz_subnet02_prefix}", "10.245.240.0/27" ]
  }
  security_rule {
    name                       = "allow_media_udp"
    description				   = "Permit access to ephemeral UDP media ports"
    priority                   = "155"
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Udp"
    source_port_range          = "*"
    destination_port_range     = "40000-49999"
    source_address_prefix      = "*"
    destination_address_prefixes = [ "${var.dmz_subnet02_prefix}", "10.245.240.0/27" ]
  }
  security_rule {
    name                       = "allow_management_traffic"
    description				   = "Permit access to ephemeral UDP media ports"
    priority                   = "160"
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "40000-49999"
    source_address_prefix      = "*"
    destination_address_prefixes = [ "${var.dmz_subnet02_prefix}", "10.245.240.0/27" ]
  }
  security_rule {
    name                       = "allow_mport_8443"
    description                = "Permit access to ephemeral UDP media ports"
    priority                   = "165"
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "8443"
    source_address_prefix      = "10.245.32.0/20"
    destination_address_prefixes = [ "${var.dmz_subnet02_prefix}", "10.245.240.0/27" ]
  }
    security_rule {
    name                       = "syslog-ng_collector_server"
    description                = "Permit access to ephemeral UDP media ports"
    priority                   = "170"
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "514"
    source_address_prefix      = "${var.dmz_subnet02_prefix}"
    destination_address_prefixes = [ "10.221.39.5" ]
  }
#### Outbound Rules for Conferencing Nodes
  security_rule {
    name                       = "allow_dns_traffic"
    description                = "Permit access to DNS Server"
    priority                   = "200"
    direction                  = "Outbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "55000-65535"
    destination_port_range     = "53"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
    #Add the DNS server address
  }
  security_rule {
    name                       = "allow_pexip_incident_reporting"
    description                = "Permit access to Pexip ACR Server"
    priority                   = "205"
    direction                  = "Outbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "55000-65535"
    destination_port_range     = "443"
    source_address_prefixes      = [ "${var.dmz_subnet02_prefix}", "10.245.240.0/27" ]
    destination_address_prefix = "*"
    #Add the Pexip ACR reporting server
  }
  security_rule {
    name                       = "allow_AD_FSS_SSO_traffic"
    description                = "Permit access to AD FS server"
    priority                   = "210"
    direction                  = "Outbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "55000-65535"
    destination_port_range     = "443"
    source_address_prefixes      = [ "${var.dmz_subnet02_prefix}", "10.245.240.0/27" ]
    destination_address_prefix = "*"
    #Add the Pexip AD FS Server
  }
  security_rule {
    name                       = "allow_h323_sip"
    description                = "Permit access to Google Hangouts"
    priority                   = "215"
    direction                  = "Outbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "33000-39999"
    destination_port_range     = "*"
    source_address_prefixes      = [ "${var.dmz_subnet02_prefix}", "10.245.240.0/27" ]
    destination_address_prefix = "*"
  }
  security_rule {
    name                       = "allow_RTP_Tcp"
    description                = "Permit access to Google Hangouts"
    priority                   = "220"
    direction                  = "Outbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "40000-49999"
    destination_port_range     = "*"
    source_address_prefixes      = [ "${var.dmz_subnet02_prefix}", "10.245.240.0/27" ]
    destination_address_prefix = "*"
  }
  security_rule {
    name                       = "allow_RTP_Udp"
    description                = "Permit access to Google Hangouts"
    priority                   = "225"
    direction                  = "Outbound"
    access                     = "Allow"
    protocol                   = "Udp"
    source_port_range          = "40000-49999"
    destination_port_range     = "*"
    source_address_prefixes      = [ "${var.dmz_subnet02_prefix}", "10.245.240.0/27" ]
    destination_address_prefix = "*"
  }
  security_rule {
    name                       = "allow_sfb_lync"
    description                = "Permit access to Google Hangouts"
    priority                   = "230"
    direction                  = "Outbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "55000-65535"
    destination_port_range     = "443"
    source_address_prefixes      = [ "${var.dmz_subnet02_prefix}", "10.245.240.0/27" ]
    destination_address_prefix = "*"
  }
  security_rule {
    name                       = "allow_sfb_lync_https"
    description                = "Permit access to Google Hangouts"
    priority                   = "235"
    direction                  = "Outbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "55000-65535"
    destination_port_range     = "443"
    source_address_prefixes      = [ "${var.dmz_subnet02_prefix}", "10.245.240.0/27" ]
    destination_address_prefix = "*"
    #Add the sfb/lync server
  }
  security_rule {
    name                       = "allow_sfb_lync_psom"
    description                = "Permit access to Google Hangouts"
    priority                   = "240"
    direction                  = "Outbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "55000-65535"
    destination_port_range     = "8057"
    source_address_prefixes      = [ "${var.dmz_subnet02_prefix}", "10.245.240.0/27" ]
    destination_address_prefix = "*"
    #Add the sfb/lync server
  }
  security_rule {
    name                       = "allow_ntp"
    description                = "Permit access to Google Hangouts"
    priority                   = "245"
    direction                  = "Outbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "55000-65535"
    destination_port_range     = "123"
    source_address_prefixes      = [ "${var.dmz_subnet02_prefix}", "10.245.240.0/27" ]
    destination_address_prefix = "*"
    #Add the NTP Time Server for Azure
  }
  security_rule {
    name                       = "allow_mgmt_node"
    description                = "Permit access to Google Hangouts"
    priority                   = "250"
    direction                  = "Outbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "500"
    destination_port_range     = "500"
    source_address_prefixes      = [ "${var.dmz_subnet02_prefix}", "10.245.240.0/27" ]
    destination_address_prefix = "*"
    #Allow Management Node communication
 }
    security_rule {
    name                       = "syslog-ng_collector_server_outbound"
    description                = "Permit access to ephemeral UDP media ports"
    priority                   = "255"
    direction                  = "Outbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "514"
    source_address_prefix      = "${var.dmz_subnet02_prefix}"
    destination_address_prefixes = [ "10.221.39.5" ]
  }
tags {
    application = "pexip-conference"
    project     = "pexip"
    environment = "${var.appenv}"
  }
 }


