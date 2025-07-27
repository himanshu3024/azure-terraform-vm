# Complete deployment script for Azure VM + Ansible (PowerShell)
# Usage: .\deploy.ps1

param(
    [switch]$SkipConfirmation
)

Write-Host "🚀 Starting Azure VM + Ansible Deployment" -ForegroundColor Green
Write-Host "==========================================" -ForegroundColor Green

# Check if terraform.tfvars exists
if (-not (Test-Path "terraform.tfvars")) {
    Write-Host "❌ Error: terraform.tfvars file not found!" -ForegroundColor Red
    Write-Host "Please copy terraform.tfvars.example to terraform.tfvars and update it with your values:" -ForegroundColor Yellow
    Write-Host "Copy-Item terraform.tfvars.example terraform.tfvars" -ForegroundColor Cyan
    Write-Host "Then edit terraform.tfvars with your Azure credentials and SSH key" -ForegroundColor Yellow
    exit 1
}

# Check if SSH key exists (for Windows, check common locations)
$sshKeyPath = "$env:USERPROFILE\.ssh\id_rsa"
if (-not (Test-Path $sshKeyPath)) {
    Write-Host "❌ Error: SSH private key not found at $sshKeyPath" -ForegroundColor Red
    Write-Host "Please generate an SSH key pair:" -ForegroundColor Yellow
    Write-Host "ssh-keygen -t rsa -b 4096" -ForegroundColor Cyan
    exit 1
}

# Check if WSL is available for Ansible
$wslAvailable = wsl --list --quiet 2>$null
if (-not $wslAvailable) {
    Write-Host "❌ Error: WSL is not available!" -ForegroundColor Red
    Write-Host "Please install WSL first:" -ForegroundColor Yellow
    Write-Host "wsl --install" -ForegroundColor Cyan
    exit 1
}

Write-Host "✅ Prerequisites check passed" -ForegroundColor Green

# Step 1: Initialize Terraform
Write-Host ""
Write-Host "📦 Step 1: Initializing Terraform..." -ForegroundColor Blue
terraform init

# Step 2: Plan Terraform deployment
Write-Host ""
Write-Host "📋 Step 2: ePlanning Terraform deployment..." -ForegroundColor Blue
terraform plan

# Ask for confirmation
if (-not $SkipConfirmation) {
    $confirmation = Read-Host "Do you want to proceed with the deployment? (y/N)"
    if ($confirmation -ne "y" -and $confirmation -ne "Y") {
        Write-Host "Deployment cancelled" -ForegroundColor Yellow
        exit 0
    }
}

# Step 3: Apply Terraform configuration
Write-Host ""
Write-Host "🏗️  Step 3: Creating Azure resources..." -ForegroundColor Blue
terraform apply -auto-approve

# Step 4: Get the public IP
Write-Host ""
Write-Host "🌐 Step 4: Getting VM public IP..." -ForegroundColor Blue
$publicIP = terraform output -raw public_ip_address
Write-Host "VM Public IP: $publicIP" -ForegroundColor Green

# Step 5: Update Ansible inventory
Write-Host ""
Write-Host "📝 Step 5: Updating Ansible inventory..." -ForegroundColor Blue
& .\update-inventory.ps1

# Step 6: Wait for VM to be ready
Write-Host ""
Write-Host "⏳ Step 6: Waiting for VM to be ready (30 seconds)..." -ForegroundColor Blue
Start-Sleep -Seconds 30

# Step 7: Run Ansible playbook using WSL
Write-Host ""
Write-Host "🔧 Step 7: Configuring VM with Ansible (using WSL)..." -ForegroundColor Blue
wsl bash deploy-wsl.sh

Write-Host ""
Write-Host "🎉 Deployment completed successfully!" -ForegroundColor Green
Write-Host "==========================================" -ForegroundColor Green
Write-Host "🌐 Your website is available at: http://$publicIP" -ForegroundColor Cyan
Write-Host "🔗 SSH connection: ssh azureuser@$publicIP" -ForegroundColor Cyan
Write-Host ""
Write-Host "To destroy the infrastructure when done:" -ForegroundColor Yellow
Write-Host "terraform destroy" -ForegroundColor Cyan 