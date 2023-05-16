data "template_file" "cloud" {
    count = "1"
    template = "${file("scripts/cloud-init.tpl")}"
    vars = {
      username                = var.ntnx_vm_rocky_username
      username_password       = var.ntnx_vm_rocky_username_password
      root_password           = var.ntnx_vm_rocky_root_password
      interface_name          = var.ntnx_vm_rocky_interface_name
      interface_address       = var.ntnx_vm_rocky_interface_address
      interface_netmask       = var.ntnx_vm_rocky_interface_netmask
      interface_gateway       = var.ntnx_vm_rocky_interface_gateway
      interface_primary_dns   = var.ntnx_vm_rocky_primary_dns
      interface_secondary_dns = var.ntnx_vm_rocky_secondary_dns
      hostname                = var.ntnx_vm_rocky_hostname
      domain                  = var.ntnx_vm_rocky_domain
  }
}


resource "nutanix_virtual_machine" "vm_rocky" {
    count = "${var.ntnx_vm_rocky_count}"
    name = "${var.ntnx_vm_rocky_name}"
    cluster_uuid = "${data.nutanix_cluster.cluster.id}"
    nic_list {
        subnet_uuid = "${data.nutanix_subnet.ahv_network.id}"
        #ip_endpoint_list  {
        #    ip = "${var.ntnx_vm_rocky_network_ip}"
        #    type = "ASSIGNED"
        #}  
    }
    disk_list {
        data_source_reference = {
            kind = "image"
            uuid = "${data.nutanix_image.ahv_image.id}"
        }
        device_properties {
            disk_address = {
                device_index = 1
                adapter_type = "SCSI"
            }
            device_type = "DISK"
        }
    }
    num_vcpus_per_socket = "1"
    num_sockets          = "${var.ntnx_vm_rocky_vcpu}"
    memory_size_mib      = "${var.ntnx_vm_rocky_memory}"
    guest_customization_cloud_init_user_data = "${base64encode("${element(data.template_file.cloud.*.rendered,count.index)}")}"
}