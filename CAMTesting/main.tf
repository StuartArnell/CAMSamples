#####################################################################
##
##      Created 6/25/19 by admin. for CAMTesting
##
#####################################################################

## REFERENCE {"azure_network":{"type": "azurerm_reference_network"}}

terraform {
  required_version = "> 0.8.0"
}

provider "azurerm" {
  subscription_id = "${var.subscription_id}"
  client_id       = "${var.client_id}"
  client_secret   = "${var.client_secret}"
  tenant_id       = "${var.tenant_id}"
  version = "~> 1.1"
}


resource "azurerm_virtual_machine" "MSLinux" {
  name                  = "${var.MSLinux_name}"
  location              = "${var.vm_location}"
  vm_size               = "${var.vm_size}"
  resource_group_name = "${var.MSLinux_os_profile_name}"  # Specifies the os profile name.
  network_interface_ids = ["${azurerm_network_interface.interface.id}"]
  tags {
    Name = "${var.MSLinux_name}"
  }
  os_profile {
    computer_name  = "${var.MSLinux_os_profile_name}"
    admin_username = "${var.MSLinux_azure_user}"
    admin_password = "${var.MSLinux_azure_user_password}"
  }
  storage_image_reference {
    publisher = "${var.MSLinux_publisher}"
    offer     = "${var.MSLinux_offer}"
    sku       = "${var.MSLinux_sku}"
    version   = "${var.MSLinux_version}"
  }
  os_profile_linux_config {
    disable_password_authentication = "${var.MSLinux_disable_password_authentication}"
  }
  storage_os_disk {
    name              = "${var.MSLinux_os_disk_name}"
    caching           = "${var.MSLinux_os_disk_caching}"
    create_option     = "${var.MSLinux_os_disk_create_option}"
    managed_disk_type = "${var.MSLinux_os_disk_managed_disk_type}"
  }
  delete_os_disk_on_termination = "${var.MSLinux_os_disk_delete}"
}

resource "azurerm_resource_group" "group" {
  name     = "group"
  location = "${var.location}"
}

resource "azurerm_network_interface" "interface" {
  name                = "${var.network_interface_name}"
  location            = "${var.vm_location}"
  resource_group_name = "${var.MSLinux_os_profile_name}"
  ip_configuration {
    name                          = "ipConfig"
    private_ip_address_allocation = "Static"
    subnet_id  = "${azurerm_subnet.subnet.id}"
  }
}

resource "azurerm_subnet" "subnet" {
  name                 = "subnet"
  virtual_network_name = "${var.subnet_reference_network_name}"
  address_prefix       = "${var.address_prefix}"
  resource_group_name  = "${var.MSLinux_os_profile_name}"
}