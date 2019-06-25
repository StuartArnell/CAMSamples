#####################################################################
##
##      Created 6/25/19 by admin. for CAMTesting
##
#####################################################################

variable "subscription_id" {
  type = "string"
  description = "Generated"
}

variable "client_id" {
  type = "string"
  description = "Generated"
}

variable "client_secret" {
  type = "string"
  description = "Generated"
}

variable "tenant_id" {
  type = "string"
  description = "Generated"
}

variable "MSLinux_name" {
  type = "string"
  description = "Generated"
}

variable "vm_location" {
  type = "string"
  description = "Generated"
}

variable "vm_size" {
  type = "string"
  description = "Generated"
}

variable "MSLinux_os_profile_name" {
  type = "string"
  description = "Specifies the os profile name."
  default = "profilename"
}

variable "MSLinux_azure_user" {
  type = "string"
  description = "Generated"
}

variable "MSLinux_azure_user_password" {
  type = "string"
  description = "Generated"
}

variable "MSLinux_publisher" {
  type = "string"
  default = "Canonical"
}

variable "MSLinux_offer" {
  type = "string"
  default = "UbuntuServer"
}

variable "MSLinux_sku" {
  type = "string"
  default = "16.04-LTS"
}

variable "MSLinux_version" {
  type = "string"
  default = "latest"
}

variable "MSLinux_disable_password_authentication" {
  type = "string"
  description = "Specifies whether to disable password authentication"
  default = "false"
}

variable "MSLinux_os_disk_name" {
  type = "string"
  description = "Specifies the disk name."
  default ="MSLinux_osdiskname"
}

variable "MSLinux_os_disk_caching" {
  type = "string"
  description = "Specifies the caching requirements. (Ex:ReadWrite)"
  default="ReadWrite"
}

variable "MSLinux_os_disk_create_option" {
  type = "string"
  description = "Specifies how the virtual machine should be created. Possible values are Attach (managed disks only) and FromImage."
}

variable "MSLinux_os_disk_managed_disk_type" {
  type = "string"
  description = "Specifies the type of managed disk to create. Value must be either Standard_LRS or Premium_LRS. Cannot be used when vhd_uri is specified"
  default = "Standard_LRS"
}

variable "MSLinux_os_disk_delete" {
  type = "string"
  description = "Delete the OS disk automatically when deleting the VM"
  default = true
}

variable "location" {
  type = "string"
  description = "Generated"
}

