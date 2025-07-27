# Script to update Ansible inventory with Terraform output IP (PowerShell)
# Usage: .\update-inventory.ps1

Write-Host "Getting VM public IP from Terraform output..." -ForegroundColor Blue

# Get the public IP from Terraform output
$publicIP = terraform output -raw public_ip_address

if (-not $publicIP) {
    Write-Host "Error: Could not get public IP from Terraform output" -ForegroundColor Red
    Write-Host "Make sure you have run 'terraform apply' first" -ForegroundColor Yellow
    exit 1
}

Write-Host "VM Public IP: $publicIP" -ForegroundColor Green

# Update the inventory file
Write-Host "Updating ansible/inventory.ini..." -ForegroundColor Blue

# Create a backup of the original inventory
Copy-Item ansible/inventory.ini ansible/inventory.ini.backup

# Read the inventory file
$inventoryContent = Get-Content ansible/inventory.ini

# Replace the IP in the inventory file using regex
$updatedContent = $inventoryContent -replace '^(\d{1,3}\.){3}\d{1,3}', $publicIP

# Write the updated content back to the file
$updatedContent | Set-Content ansible/inventory.ini

Write-Host "Inventory updated successfully!" -ForegroundColor Green
Write-Host "You can now run: ansible-playbook -i ansible/inventory.ini ansible/site.yml" -ForegroundColor Cyan 