#!/bin/bash

# Script to update Ansible inventory with Terraform output IP
# Usage: ./update-inventory.sh

set -e

echo "Getting VM public IP from Terraform output..."

# Get the public IP from Terraform output
PUBLIC_IP=$(terraform output -raw public_ip_address)

if [ -z "$PUBLIC_IP" ]; then
    echo "Error: Could not get public IP from Terraform output"
    echo "Make sure you have run 'terraform apply' first"
    exit 1
fi

echo "VM Public IP: $PUBLIC_IP"

# Update the inventory file
echo "Updating ansible/inventory.ini..."

# Create a backup of the original inventory
cp ansible/inventory.ini ansible/inventory.ini.backup

# Replace the IP in the inventory file
sed -i "s/^[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}/$PUBLIC_IP/" ansible/inventory.ini

echo "Inventory updated successfully!"
echo "You can now run: ansible-playbook -i ansible/inventory.ini ansible/site.yml" 