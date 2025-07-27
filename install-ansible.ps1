# Script to install Ansible on Windows
# Usage: .\install-ansible.ps1

Write-Host "🔧 Installing Ansible on Windows..." -ForegroundColor Blue

# Check if Python is installed
$pythonVersion = python --version 2>$null
if (-not $pythonVersion) {
    Write-Host "❌ Python is not installed. Installing Python first..." -ForegroundColor Red
    
    # Try to install Python using winget
    try {
        winget install Python.Python.3.11
        Write-Host "✅ Python installed successfully" -ForegroundColor Green
        # Refresh environment variables
        $env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")
    }
    catch {
        Write-Host "❌ Failed to install Python via winget. Please install Python manually from https://python.org" -ForegroundColor Red
        exit 1
    }
}

# Check if Ansible is already installed
$ansibleVersion = ansible --version 2>$null
if ($ansibleVersion) {
    Write-Host "✅ Ansible is already installed" -ForegroundColor Green
    ansible --version
    exit 0
}

Write-Host "📦 Installing Ansible using pip..." -ForegroundColor Blue

# Install Ansible using pip
try {
    pip install ansible
    Write-Host "✅ Ansible installed successfully!" -ForegroundColor Green
    
    # Verify installation
    $ansibleVersion = ansible --version 2>$null
    if ($ansibleVersion) {
        Write-Host "✅ Ansible installation verified:" -ForegroundColor Green
        ansible --version
    } else {
        Write-Host "❌ Ansible installation failed" -ForegroundColor Red
        exit 1
    }
}
catch {
    Write-Host "❌ Failed to install Ansible via pip. Trying alternative methods..." -ForegroundColor Red
    
    # Try using winget as alternative
    try {
        Write-Host "🔄 Trying winget installation..." -ForegroundColor Yellow
        winget install Ansible.Ansible
        Write-Host "✅ Ansible installed via winget!" -ForegroundColor Green
    }
    catch {
        Write-Host "❌ Failed to install Ansible. Please install manually:" -ForegroundColor Red
        Write-Host "1. Install Python from https://python.org" -ForegroundColor Yellow
        Write-Host "2. Run: pip install ansible" -ForegroundColor Yellow
        Write-Host "3. Or use: winget install Ansible.Ansible" -ForegroundColor Yellow
        exit 1
    }
}

Write-Host ""
Write-Host "🎉 Ansible installation completed!" -ForegroundColor Green
Write-Host "You can now run the deployment script: .\deploy.ps1" -ForegroundColor Cyan 