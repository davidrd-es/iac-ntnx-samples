#cloud-config
hostname: ${hostname}
fqdn: ${hostname}.${domain}
users:
  - name: ${username}
    sudo: ['ALL=(ALL) NOPASSWD:ALL']
chpasswd:
  list: |
    root:${root_password}
    ${username}:${username_password}
  expire: False
ssh_pwauth: true
write_files:
    - content: |
        [connection]
        id=${interface_name}-mgmt
        type=ethernet
        interface-name=${interface_name}
        
        [ethernet]
        
        [ipv4]
        address1=${interface_address}/${interface_netmask},${interface_gateway}
        dns=${interface_primary_dns};${interface_secondary_dns}
        may-fail=false
        method=manual
        
        [ipv6]
        method=disabled
  
        [proxy]
  
      path: /etc/NetworkManager/system-connections/${interface_name}-mgmt.nmconnection
      permissions: "0600"
runcmd:
  - [nmcli, con, del, ${interface_name}]
  - [systemctl, mask, cloud-init-local, cloud-init, cloud-config, cloud-final]
  - [systemctl, restart, NetworkManager]
  - [eject]
  #- [reboot]