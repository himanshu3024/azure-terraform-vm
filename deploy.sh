#!/bin/bash

# Complete deployment script for Azure VM + Ansible
# Usage: ./deploy.sh

set -e

echo "🚀 Starting Azure VM + Ansible Deployment"
echo "=========================================="

# Check if terraform.tfvars exists
if [ ! -f "terraform.tfvars" ]; then
    echo "❌ Error: terraform.tfvars file not found!"
    echo "Please copy terraform.tfvars.example to terraform.tfvars and update it with your values:"
    echo "cp terraform.tfvars.example terraform.tfvars"
    echo "Then edit terraform.tfvars with your Azure credentials and SSH key"
    exit 1
fi

# Check if SSH key exists
if [ ! -f ~/.ssh/id_rsa ]; then
    echo "❌ Error: SSH private key not found at ~/.ssh/id_rsa"
    echo "Please generate an SSH key pair:"
    echo "ssh-keygen -t rsa -b 4096"
    exit 1
fi

echo "✅ Prerequisites check passed"

# Step 1: Initialize Terraform
echo ""
echo "📦 Step 1: Initializing Terraform..."
terraform init

# Step 2: Plan Terraform deployment
echo ""
echo "📋 Step 2: Planning Terraform deployment..."
terraform plan

# Ask for confirmation
read -p "Do you want to proceed with the deployment? (y/N): " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "Deployment cancelled"
    exit 0
fi

# Step 3: Apply Terraform configuration
echo ""
echo "🏗️  Step 3: Creating Azure resources..."
terraform apply -auto-approve

# Step 4: Get the public IP
echo ""
echo "🌐 Step 4: Getting VM public IP..."
PUBLIC_IP=$(terraform output -raw public_ip_address)
echo "VM Public IP: $PUBLIC_IP"

# Step 5: Update Ansible inventory
echo ""
echo "📝 Step 5: Updating Ansible inventory..."
./update-inventory.sh

# Step 6: Wait for VM to be ready
echo ""
echo "⏳ Step 6: Waiting for VM to be ready (30 seconds)..."
sleep 30

# Step 7: Run Ansible playbook
echo ""
echo "🔧 Step 7: Configuring VM with Ansible..."
ansible-playbook -i ansible/inventory.ini ansible/site.yml

echo ""
echo "🎉 Deployment completed successfully!"
echo "=========================================="
echo "🌐 Your website is available at: http://$PUBLIC_IP"
echo "🔗 SSH connection: ssh azureuser@$PUBLIC_IP"
echo ""
echo "To destroy the infrastructure when done:"
echo "terraform destroy" 