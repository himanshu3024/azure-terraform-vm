#!/bin/bash

# WSL-compatible deployment script for Ansible part
# Usage: wsl bash deploy-wsl.sh

set -e

echo "🔧 Running Ansible deployment in WSL..."

# Check if we're in WSL
if [[ ! -f /proc/version ]] || ! grep -q Microsoft /proc/version; then
    echo "❌ This script should be run in WSL"
    exit 1
fi

# Install Ansible if not present
if ! command -v ansible &> /dev/null; then
    echo "📦 Installing Ansible in WSL..."
    sudo apt update
    sudo apt install -y ansible
fi

# Get the current directory (Windows path converted to WSL path)
CURRENT_DIR=$(pwd)
echo "Current directory: $CURRENT_DIR"

# Check if inventory file exists
if [ ! -f "ansible/inventory.ini" ]; then
    echo "❌ Error: ansible/inventory.ini not found"
    echo "Make sure you're in the correct directory"
    exit 1
fi

# Test SSH connectivity
echo "🔍 Testing SSH connectivity..."
ansible web -i ansible/inventory.ini -m ping

# Run the Ansible playbook
echo "🚀 Running Ansible playbook..."
ansible-playbook -i ansible/inventory.ini ansible/site.yml

echo "✅ Ansible deployment completed successfully!" 