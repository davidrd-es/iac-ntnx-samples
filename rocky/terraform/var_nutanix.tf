## Provider Variables
variable "ntnx_pe_user" {
    default = ""
}
variable "ntnx_pe_password" {
    default = ""
}
variable "ntnx_pe_ip" {
    default = ""
}
variable "ntnx_pe_port" {
    default = ""
}
variable ntnx_pe_image {
    default = ""
}
variable ntnx_pe_network {
    default = ""
}
variable ntnx_pe_storage_container_uuid {
    default = ""
}


## Resources Variables
variable "ntnx_vm_rocky_vcpu" { 
    default = ""
}
variable "ntnx_vm_rocky_memory" {
    default = ""
}
variable "ntnx_vm_rocky_count" {
    default = "1"
}
variable "ntnx_vm_rocky_disk_size" {
    default = 51200
    description = "Size Mib"
}
variable "ntnx_vm_rocky_name" {
    default = ""
}
variable "ntnx_vm_rocky_network_ip" {
    #type    = list(string)
    default = ""
}

## Guest OS configs
variable "ntnx_vm_rocky_username" { 
    default = ""
}

variable "ntnx_vm_rocky_username_password" { 
    default = ""
}

variable "ntnx_vm_rocky_root_password" { 
    default = ""
}

variable "ntnx_vm_rocky_interface_name" { 
    default = ""
}

variable "ntnx_vm_rocky_interface_address" { 
    default = ""
}

variable "ntnx_vm_rocky_interface_netmask" { 
    default = ""
}

variable "ntnx_vm_rocky_interface_gateway" { 
    default = ""
}

variable "ntnx_vm_rocky_primary_dns" { 
    default = ""
}

variable "ntnx_vm_rocky_secondary_dns" { 
    default = ""
}

variable "ntnx_vm_rocky_hostname" { 
    default = ""
}

variable "ntnx_vm_rocky_domain" { 
    default = ""
}