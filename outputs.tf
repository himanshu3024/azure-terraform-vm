output "vm_name" {
  description = "The name of the Linux Virtual Machine"
  value       = azurerm_linux_virtual_machine.vm.name
}

output "vm_id" {
  description = "The ID of the Linux Virtual Machine"
  value       = azurerm_linux_virtual_machine.vm.id
}

output "nic_private_ip" {
  description = "The private IP address of the network interface"
  value       = azurerm_network_interface.nic.private_ip_address
}

output "resource_group_name" {
  description = "The name of the resource group"
  value       = azurerm_resource_group.rg.name
}

output "public_ip_address" {
  description = "The public IP address of the VM"
  value       = azurerm_public_ip.public_ip.ip_address
}

output "ssh_connection" {
  description = "SSH connection command for the VM"
  value       = "ssh ${var.admin_username}@${azurerm_public_ip.public_ip.ip_address}"
}
