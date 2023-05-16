#provider Nutanix
ntnx_pe_user = "admin"
ntnx_pe_password = "pwd"
ntnx_pe_ip = "172.30.0.60"
ntnx_pe_port = "9440"
ntnx_pe_network = "az1-1000-mgmt"
ntnx_pe_image = "rocky-9.1-20230317064431"
ntnx_pe_storage_container_uuid = "5e853a48-c1be-433c-bbb0-143a6e19b357"

#resource Nutanix VM - Openshift Bootstrap
ntnx_vm_rocky_count = 1
ntnx_vm_rocky_name = "nexus"
ntnx_vm_rocky_vcpu = 4
ntnx_vm_rocky_memory = 2 * 1024
ntnx_vm_rocky_disk_size = 1024 * 1024
ntnx_vm_rocky_network_ip = "10.0.0.10"

## Guest OS configs
ntnx_vm_rocky_username = "patata"
ntnx_vm_rocky_username_password = "nutanix"
ntnx_vm_rocky_root_password = "nutanix"
ntnx_vm_rocky_interface_name = "ens3"
ntnx_vm_rocky_interface_address = "10.0.0.10"
ntnx_vm_rocky_interface_netmask = "24"
ntnx_vm_rocky_interface_gateway = "10.0.0.1"
ntnx_vm_rocky_primary_dns = "172.30.0.3"
ntnx_vm_rocky_secondary_dns = ""
ntnx_vm_rocky_hostname = "nexus"
ntnx_vm_rocky_domain = "pepotheitdog.local"


