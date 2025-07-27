# 🌐 Azure VM + Terraform + Ansible Project

[![Terraform](https://img.shields.io/badge/Terraform-7C3AED?style=for-the-badge&logo=terraform&logoColor=white)](https://www.terraform.io/)
[![Azure](https://img.shields.io/badge/Azure-0078D4?style=for-the-badge&logo=microsoft-azure&logoColor=white)](https://azure.microsoft.com/)
[![Ansible](https://img.shields.io/badge/Ansible-EE0000?style=for-the-badge&logo=ansible&logoColor=white)](https://www.ansible.com/)
[![NGINX](https://img.shields.io/badge/NGINX-009639?style=for-the-badge&logo=nginx&logoColor=white)](https://nginx.org/)
[![Ubuntu](https://img.shields.io/badge/Ubuntu-E95420?style=for-the-badge&logo=ubuntu&logoColor=white)](https://ubuntu.com/)

This project demonstrates how to create an Azure Virtual Machine using **Terraform**, and then configure it using **Ansible** to serve a simple static website using **NGINX**.

---

## 🌐 Live Demo

**🌐 Website**: http://20.185.218.70

**Features Demonstrated**:
- ✅ Azure VM with Ubuntu 20.04 LTS
- ✅ NGINX web server with static HTML
- ✅ SSH access for remote management
- ✅ Network Security Group with proper firewall rules
- ✅ Automated deployment with Terraform + Ansible

---

## 🚀 What This Project Does

1. **Creates a virtual machine** in Azure using Terraform with proper networking and security
2. **Configures the VM** using Ansible to:
   - Install NGINX
   - Copy a static index.html file
   - Start the NGINX web server
3. 🎯 **Result**: You can view the static website using the public IP of your VM

---

## 📁 Project Structure

```
azure-terraform-vm/
├── 📁 .github/
│   └── 📁 workflows/
│       └── deploy.yml
├── 📁 ansible/
│   ├── 📁 files/
│   │   └── index.html
│   ├── inventory.ini
│   └── site.yml
├── 📁 screenshots/
│   ├── 01-project-structure.png
│   ├── 02-terraform-deployment.png
│   ├── 03-azure-resources.png
│   ├── 04-nsg-rules.png
│   ├── 05-ansible-deployment.png
│   ├── 06-website-live.png
│   └── 07-terraform-outputs.png
├── 📁 docs/
│   ├── ARCHITECTURE.md
│   ├── SCREENSHOTS.md
│   └── GITHUB_SETUP.md
├── .gitignore
├── ARCHITECTURE.md
├── deploy.ps1
├── deploy.sh
├── deploy-wsl.sh
├── install-ansible.ps1
├── main.tf
├── outputs.tf
├── README.md
├── SCREENSHOTS.md
├── terraform.tfvars.example
├── test-website.sh
├── update-inventory.ps1
├── update-inventory.sh
└── variables.tf
```

---

## 🛠️ Tools Used

- **Terraform** – to provision Azure infrastructure
- **Ansible** – to configure the VM
- **Azure CLI** – to authenticate and manage resources
- **NGINX** – as the web server

## 🏗️ Architecture

This project implements a **multi-tier cloud infrastructure** using Infrastructure as Code (IaC) principles.

**Technology Stack**:
- **Infrastructure**: Terraform, Azure Resource Manager
- **Configuration**: Ansible, NGINX
- **Security**: SSH Keys, Network Security Groups
- **Automation**: PowerShell, WSL, Git

For detailed architecture information, see [ARCHITECTURE.md](ARCHITECTURE.md).

---

## 📋 Prerequisites

Before running this project, make sure you have:

- [Azure CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli) installed
- [Terraform](https://www.terraform.io/downloads.html) installed
- [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html) installed
- An active Azure subscription
- SSH key pair generated (`ssh-keygen -t rsa -b 4096`)

---

## ⚙️ Quick Start (Recommended)

### 1️⃣ Clone and Setup

```bash
git clone <your-repo-url>
cd azure-terraform-vm

# Copy the example variables file
cp terraform.tfvars.example terraform.tfvars

# Edit terraform.tfvars with your Azure credentials and SSH key
nano terraform.tfvars
```

### 2️⃣ Configure Variables

Edit `terraform.tfvars` with your values:

```hcl
# Azure Authentication
subscription_id = "your-subscription-id"
client_id       = "your-service-principal-client-id"
client_secret   = "your-service-principal-client-secret"
tenant_id       = "your-tenant-id"

# SSH Configuration
admin_ssh_public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC..."
```

### 3️⃣ Deploy Everything

```bash
# Make scripts executable
chmod +x deploy.sh update-inventory.sh

# Run the complete deployment
./deploy.sh
```

This script will:
- ✅ Check prerequisites
- 🏗️ Create Azure resources with Terraform
- 🔧 Configure the VM with Ansible
- 🌐 Deploy your website

---

## 🔧 Manual Deployment

If you prefer to run steps manually:

### 1️⃣ Azure Authentication

```bash
# Login to Azure
az login

# Set your subscription (if you have multiple)
az account set --subscription "Your-Subscription-Name"
```

### 2️⃣ Terraform: Create Azure VM

```bash
# Initialize Terraform
terraform init

# Plan the deployment
terraform plan

# Apply the configuration
terraform apply
```

### 3️⃣ Ansible: Configure VM

```bash
# Update inventory with VM IP
./update-inventory.sh

# Run the Ansible playbook
ansible-playbook -i ansible/inventory.ini ansible/site.yml
```

### 4️⃣ 🌐 View Your Website

Open your browser and go to:
```
http://<your-vm-public-ip>
```

---

## ✅ Example Output

After successful deployment:

```bash
$ ./deploy.sh
🚀 Starting Azure VM + Ansible Deployment
==========================================
✅ Prerequisites check passed

📦 Step 1: Initializing Terraform...
📋 Step 2: Planning Terraform deployment...
🏗️  Step 3: Creating Azure resources...
🌐 Step 4: Getting VM public IP...
VM Public IP: 20.123.456.789
📝 Step 5: Updating Ansible inventory...
🔧 Step 7: Configuring VM with Ansible...

🎉 Deployment completed successfully!
==========================================
🌐 Your website is available at: http://20.123.456.789
🔗 SSH connection: ssh azureuser@20.123.456.789
```

---

## 🧹 Cleanup

To avoid Azure charges, destroy the resources when done:

```bash
terraform destroy
```

---

## 🔧 Customization

### Modify the Website Content
Edit `ansible/files/index.html` to customize your webpage content.

### Change VM Configuration
Modify `variables.tf` or `terraform.tfvars` to adjust:
- VM size (`vm_size`)
- Operating system (in `main.tf`)
- Location/region (`location`)
- Project name (`project_name`)

### Add More Ansible Tasks
Extend `ansible/site.yml` to install additional software or configurations.

---

## 📸 Screenshots

### Project Overview
![Project Structure](screenshots/01-project-structure.png)

### Deployment Process
![Terraform Deployment](screenshots/02-terraform-deployment.png)
![Azure Resources](screenshots/03-azure-resources.png)

### Security Configuration
![NSG Rules](screenshots/04-nsg-rules.png)

### Application Deployment
![Ansible Deployment](screenshots/05-ansible-deployment.png)
![Website Live](screenshots/06-website-live.png)

### Verification
![Terraform Outputs](screenshots/07-terraform-outputs.png)

---

## 🚀 Advanced Features

- **Security**: SSH access enabled with proper NSG rules
- **Automation**: Complete deployment script with error handling
- **Flexibility**: All hardcoded values replaced with variables
- **Idempotency**: Safe to run multiple times

---

## 🐛 Troubleshooting

### Common Issues:

1. **SSH Connection Failed**
   - Ensure your SSH key is properly configured in `terraform.tfvars`
   - Check that the private key exists at `~/.ssh/id_rsa`

2. **Ansible Connection Timeout**
   - Verify the VM is running: `az vm list --output table`
   - Check the public IP in inventory.ini matches Terraform output
   - Wait a few minutes after VM creation for it to fully boot

3. **Website Not Loading**
   - Ensure NSG allows HTTP traffic (port 80) - this is configured automatically
   - Check NGINX status: `ssh azureuser@<ip> 'sudo systemctl status nginx'`

4. **Terraform Authentication Error**
   - Verify your Azure credentials in `terraform.tfvars`
   - Run `az login` to refresh your session

---

## 📚 Learning Resources

- [Terraform Azure Provider Documentation](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs)
- [Ansible Documentation](https://docs.ansible.com/)
- [Azure Virtual Machines Documentation](https://docs.microsoft.com/en-us/azure/virtual-machines/)

---

## 👨‍💻 Author

**Himanshu Gandhi**
- GitHub: [@himanshu3024](https://github.com/himanshu3024)

---

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

1. Fork the project
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

---

## 📄 License

This project is licensed under the MIT License.

---

## 🏷️ Tags

`#Azure` `#Terraform` `#Ansible` `#DevOps` `#InfrastructureAsCode` `#CloudComputing` `#IaC` `#Automation`
