# GitHub Secrets Setup Guide

This guide will help you set up the required GitHub secrets for the Terraform deployment workflow.

## Required GitHub Secrets

You need to add the following secrets to your GitHub repository:

### Azure Authentication Secrets (Required)
1. **ARM_SUBSCRIPTION_ID** - Your Azure subscription ID
2. **ARM_CLIENT_ID** - Azure service principal client ID
3. **ARM_CLIENT_SECRET** - Azure service principal client secret
4. **ARM_TENANT_ID** - Your Azure tenant ID

### SSH Key Secret (Required)
5. **ADMIN_SSH_PUBLIC_KEY** - Your SSH public key for VM access

### Optional Configuration Secrets
6. **LOCATION** - Azure region (default: "East US")
7. **PROJECT_NAME** - Project name for resource naming (default: "azure-vm-project")
8. **RESOURCE_GROUP_NAME** - Resource group name (default: "myResourceGroup")
9. **VM_SIZE** - VM size (default: "Standard_B1s")
10. **ADMIN_USERNAME** - Admin username for VM (default: "azureuser")

## How to Add GitHub Secrets

1. Go to your GitHub repository
2. Click on **Settings** tab
3. In the left sidebar, click on **Secrets and variables** → **Actions**
4. Click **New repository secret** for each secret below

## Step-by-Step Setup

### 1. Get Azure Credentials

First, you need to create a service principal in Azure:

```bash
# Login to Azure CLI
az login

# Create service principal (replace 'your-app-name' with a unique name)
az ad sp create-for-rbac --name "your-app-name" --role contributor

# This will output something like:
# {
#   "appId": "your-client-id",
#   "displayName": "your-app-name",
#   "name": "http://your-app-name",
#   "password": "your-client-secret",
#   "tenant": "your-tenant-id"
# }
```

### 2. Get Your Subscription ID

```bash
az account show --query id --output tsv
```

### 3. Generate SSH Key (if you don't have one)

```bash
# Generate SSH key pair
ssh-keygen -t rsa -b 4096 -C "your-email@example.com"

# Display the public key
cat ~/.ssh/id_rsa.pub
```

### 4. Add GitHub Secrets

Add these secrets to your GitHub repository:

| Secret Name | Value | Description |
|-------------|-------|-------------|
| `ARM_SUBSCRIPTION_ID` | Your subscription ID | From `az account show` |
| `ARM_CLIENT_ID` | Your client ID | From service principal creation |
| `ARM_CLIENT_SECRET` | Your client secret | From service principal creation |
| `ARM_TENANT_ID` | Your tenant ID | From service principal creation |
| `ADMIN_SSH_PUBLIC_KEY` | Your SSH public key | From `cat ~/.ssh/id_rsa.pub` |

### 5. Optional Secrets (with defaults)

You can also set these for customization:

| Secret Name | Default Value | Description |
|-------------|---------------|-------------|
| `LOCATION` | "East US" | Azure region |
| `PROJECT_NAME` | "azure-vm-project" | Project name |
| `RESOURCE_GROUP_NAME` | "myResourceGroup" | Resource group name |
| `VM_SIZE` | "Standard_B1s" | VM size |
| `ADMIN_USERNAME` | "azureuser" | Admin username |

## Testing the Setup

1. Push any change to the `main` branch
2. Go to **Actions** tab in your repository
3. You should see the "Deploy Azure VM" workflow running
4. Check the logs to ensure all variables are properly set

## Troubleshooting

### Common Issues:

1. **"No value for required variable"** - Make sure all required secrets are set
2. **Authentication failed** - Verify your Azure credentials are correct
3. **SSH key format error** - Ensure the SSH public key is in the correct format (starts with `ssh-rsa`)

### Security Notes:

- Never commit `terraform.tfvars` to the repository
- The `.gitignore` file already excludes sensitive files
- GitHub secrets are encrypted and secure
- Rotate your Azure service principal credentials regularly

## Next Steps

After setting up the secrets:

1. The workflow will automatically run on pushes to `main`
2. It will create the Azure infrastructure
3. You can then run Ansible manually to configure the VM
4. Or extend the workflow to include Ansible deployment

## Manual Deployment Alternative

If you prefer not to use GitHub Actions, you can still deploy manually:

```bash
# Clone the repository
git clone <your-repo-url>
cd <your-repo-name>

# Copy your terraform.tfvars
cp terraform.tfvars.example terraform.tfvars
# Edit terraform.tfvars with your values

# Deploy
./deploy.sh  # On Linux/macOS
# or
./deploy.ps1 # On Windows
``` 