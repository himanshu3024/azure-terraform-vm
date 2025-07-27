#!/bin/bash

# Website diagnostic script
# Usage: bash test-website.sh

VM_IP="20.185.218.70"

echo "🔍 Testing website connectivity and content..."
echo "=============================================="

echo "1. Testing HTTP connectivity..."
if command -v curl &> /dev/null; then
    echo "HTTP Response:"
    curl -I http://$VM_IP
    echo ""
    echo "Website Content:"
    curl -s http://$VM_IP
else
    echo "curl not available, trying wget..."
    if command -v wget &> /dev/null; then
        wget -qO- http://$VM_IP
    else
        echo "Neither curl nor wget available"
    fi
fi

echo ""
echo "2. Testing SSH connectivity..."
ssh -o ConnectTimeout=10 -o BatchMode=yes azureuser@$VM_IP "echo 'SSH connection successful'"

echo ""
echo "3. Checking NGINX status via SSH..."
ssh azureuser@$VM_IP "sudo systemctl status nginx --no-pager"

echo ""
echo "4. Checking NGINX configuration..."
ssh azureuser@$VM_IP "sudo nginx -t"

echo ""
echo "5. Checking website files..."
ssh azureuser@$VM_IP "ls -la /var/www/html/"
ssh azureuser@$VM_IP "cat /var/www/html/index.html"

echo ""
echo "6. Checking NGINX error logs..."
ssh azureuser@$VM_IP "sudo tail -10 /var/log/nginx/error.log"

echo ""
echo "7. Checking firewall status..."
ssh azureuser@$VM_IP "sudo ufw status"

echo ""
echo "✅ Diagnostic complete!" 