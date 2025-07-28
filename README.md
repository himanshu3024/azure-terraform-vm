# 🌐 Azure VM + Terraform + Ansible Project

[![Terraform](https://img.shields.io/badge/Terraform-7C3AED?style=for-the-badge&logo=terraform&logoColor=white)](https://www.terraform.io/)
[![Azure](https://img.shields.io/badge/Azure-0078D4?style=for-the-badge&logo=microsoft-azure&logoColor=white)](https://azure.microsoft.com/)
[![Ansible](https://img.shields.io/badge/Ansible-EE0000?style=for-the-badge&logo=ansible&logoColor=white)](https://www.ansible.com/)
[![NGINX](https://img.shields.io/badge/NGINX-009639?style=for-the-badge&logo=nginx&logoColor=white)](https://nginx.org/)
[![Ubuntu](https://img.shields.io/badge/Ubuntu-E95420?style=for-the-badge&logo=ubuntu&logoColor=white)](https://ubuntu.com/)

A comprehensive **Infrastructure as Code (IaC)** project that demonstrates modern DevOps practices by creating an Azure Virtual Machine using **Terraform** and configuring it with **Ansible** to serve a static website using **NGINX**.

---

## 🎯 Project Overview

This project showcases a complete **DevOps workflow** that combines:
- **Infrastructure as Code** with Terraform
- **Configuration Management** with Ansible  
- **CI/CD Automation** with GitHub Actions
- **Cloud Infrastructure** on Microsoft Azure
- **Security Best Practices** with proper networking and access controls

### ✨ Key Features

- ✅ **Azure VM** with Ubuntu 20.04 LTS
- ✅ **NGINX Web Server** with static HTML deployment
- ✅ **SSH Key-based Access** for secure remote management
- ✅ **Network Security Groups** with proper firewall rules
- ✅ **Automated Deployment** with Terraform + Ansible
- ✅ **CI/CD Pipeline** with GitHub Actions
- ✅ **Multi-platform Support** (Windows/Linux/macOS)
- ✅ **Cost-optimized** infrastructure design

---

## 🚀 What This Project Does

### **Infrastructure Provisioning**
1. **Creates a complete Azure infrastructure** using Terraform:
   - Virtual Network with private subnet
   - Network Security Group with firewall rules
   - Public IP address for external access
   - Ubuntu 20.04 LTS Virtual Machine
   - All necessary networking components

### **Application Deployment**
2. **Configures the VM** using Ansible to:
   - Install and configure NGINX web server
   - Deploy static HTML content
   - Configure security settings
   - Enable and start services
   - Set up proper file permissions

### **Automation & CI/CD**
3. **Provides multiple deployment options**:
   - Manual deployment scripts for different platforms
   - Automated GitHub Actions CI/CD pipeline
   - Idempotent configurations for reliability

---

## 🔄 Deployment Options

### **Option 1: Manual Deployment**
Use the provided platform-specific scripts for local deployment:

| Platform | Script | Description |
|----------|--------|-------------|
| **Linux/macOS** | `deploy.sh` | Complete deployment script with prerequisites |
| **Windows** | `deploy.ps1` | PowerShell deployment script |
| **WSL** | `deploy-wsl.sh` | Windows Subsystem for Linux deployment |

### **Option 2: GitHub Actions (CI/CD)**
The project includes a fully automated CI/CD pipeline:
- **Triggers**: Automatically runs on pushes to `main` branch
- **Security**: Uses GitHub secrets for secure credential management
- **Workflow**: Deploys infrastructure → Configures VM → Runs tests
- **Monitoring**: Provides detailed logs and status updates

---

## 📁 Project Structure

```
azure-terraform-vm/
├── 📁 .github/
│   └── 📁 workflows/
│       └── deploy.yml          # GitHub Actions CI/CD workflow
├── 📁 ansible/
│   ├── 📁 files/
│   │   └── index.html          # Static website content
│   ├── inventory.ini           # Ansible inventory configuration
│   └── site.yml               # Main Ansible playbook
├── 📁 screenshots/             # Deployment and demo screenshots
│   ├── 01-project-structure.png
│   ├── 02-terraform-deployment.png
│   ├── 03-azure-resources.png
│   ├── 04-nsg-rules.png
│   ├── 05-ansible-deployment.png
│   ├── 06-website-live.png
│   ├── 07-terraform-outputs.png
│   └── 08-workflow-run-github.png
├── 📁 docs/
│   └── ARCHITECTURE.md         # Detailed architecture documentation
├── .gitignore
├── ARCHITECTURE.md             # High-level architecture overview
├── deploy.ps1                  # Windows deployment script
├── deploy.sh                   # Linux/macOS deployment script
├── deploy-wsl.sh              # WSL deployment script
├── install-ansible.ps1        # Ansible installation for Windows
├── main.tf                    # Main Terraform configuration
├── outputs.tf                 # Terraform outputs
├── README.md                  # This file
├── terraform.tfvars.example   # Example variables file
├── test-website.sh            # Website testing script
├── update-inventory.ps1       # Windows inventory update
├── update-inventory.sh        # Linux inventory update
└── variables.tf               # Terraform variables definition
```

---

## 🛠️ Technology Stack

| Technology | Purpose | Version |
|------------|---------|---------|
| **Terraform** | Infrastructure as Code | Latest |
| **Ansible** | Configuration Management | Latest |
| **Azure CLI** | Azure resource management | Latest |
| **NGINX** | Web server | Latest |
| **Ubuntu** | Operating System | 20.04 LTS |
| **GitHub Actions** | CI/CD automation | Latest |

---

## 🏗️ Architecture

This project implements a **multi-tier cloud infrastructure** using modern DevOps principles and Infrastructure as Code (IaC) practices.

### **High-Level Architecture**

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                           Azure Cloud Infrastructure                        │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                             │
│  ┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐        │
│  │   Terraform     │    │     Ansible     │    │     GitHub      │        │
│  │   (IaC)         │    │   (Config Mgmt) │    │   (Version Ctrl)│        │
│  └─────────────────┘    └─────────────────┘    └─────────────────┘        │
│           │                       │                       │                │
│           ▼                       ▼                       ▼                │
│  ┌─────────────────────────────────────────────────────────────────────────┐ │
│  │                    Azure Resource Group                                │ │
│  │  ┌─────────────────┐  ┌─────────────────┐  ┌─────────────────┐        │ │
│  │  │ Virtual Network │  │ Network Security│  │  Public IP      │        │ │
│  │  │ (10.0.0.0/16)  │  │ Group (NSG)     │  │  Address        │        │ │
│  │  │                 │  │ - SSH (Port 22) │  │                 │        │ │
│  │  │ ┌─────────────┐ │  │ - HTTP (Port 80)│  │                 │        │ │
│  │  │ │   Subnet    │ │  └─────────────────┘  └─────────────────┘        │ │
│  │  │ │(10.0.1.0/24)│ │                                               │ │
│  │  │ └─────────────┘ │  ┌─────────────────────────────────────────────┐ │ │
│  │  └─────────────────┘  │           Linux Virtual Machine             │ │ │
│  │                       │  ┌─────────────────┐  ┌─────────────────┐  │ │ │
│  │                       │  │   Ubuntu 20.04  │  │   NGINX Web     │  │ │ │
│  │                       │  │   LTS Server    │  │   Server        │  │ │ │
│  │                       │  │                 │  │                 │  │ │ │
│  │                       │  │ - SSH Access    │  │ - Static HTML   │  │ │ │
│  │                       │  │ - Admin User    │  │ - Port 80       │  │ │ │
│  │                       │  │ - SSH Keys      │  │ - Auto-start    │  │ │ │
│  │                       │  └─────────────────┘  └─────────────────┘  │ │ │
│  │                       └─────────────────────────────────────────────┘ │ │
│  └─────────────────────────────────────────────────────────────────────────┘ │
└─────────────────────────────────────────────────────────────────────────────┘
```

### **Deployment Flow**

```
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   GitHub        │    │   Terraform     │    │   Ansible       │
│   Actions       │───▶│   Infrastructure │───▶│   Configuration │
│   (Trigger)     │    │   Deployment     │    │   Management    │
└─────────────────┘    └─────────────────┘    └─────────────────┘
         │                       │                       │
         ▼                       ▼                       ▼
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   Code Push     │    │   Azure VM      │    │   NGINX Web     │
│   to Main       │    │   Creation       │    │   Server        │
└─────────────────┘    └─────────────────┘    └─────────────────┘
```

### **Security Architecture**

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                           Security Implementation                          │
├─────────────────────────────────────────────────────────────────────────────┤
│                                                                             │
│  🔐 Authentication & Access Control                                        │
│  ├── Azure Service Principal (Terraform)                                   │
│  ├── SSH Key-based Authentication (VM Access)                             │
│  └── Azure CLI Authentication (Management)                                │
│                                                                             │
│  🛡️ Network Security                                                       │
│  ├── Network Security Group (NSG)                                          │
│  │   ├── Inbound Rule: SSH (Port 22) - Allow                             │
│  │   └── Inbound Rule: HTTP (Port 80) - Allow                             │
│  ├── Private Subnet (10.0.1.0/24)                                         │
│  └── Public IP with Static Allocation                                      │
│                                                                             │
│  🔒 Data Protection                                                         │
│  ├── Encrypted VM Disks                                                    │
│  ├── Secure SSH Key Management                                             │
│  └── No Hardcoded Secrets in Code                                         │
│                                                                             │
│  🚀 Operational Security                                                   │
│  ├── Idempotent Deployments                                                │
│  ├── Automated Security Updates                                            │
│  └── Audit Trail via Terraform State                                       │
│                                                                             │
└─────────────────────────────────────────────────────────────────────────────┘
```

### **Resource Dependencies**

```
Resource Group (myResourceGroup)
    ├── Virtual Network (azure-vm-project-v2-vnet)
    │   └── Subnet (azure-vm-project-v2-subnet)
    │       └── Network Interface (azure-vm-project-v2-nic)
    ├── Public IP Address (azure-vm-project-v2-public-ip)
    │   └── Network Interface
    ├── Network Security Group (azure-vm-project-v2-nsg)
    │   └── Subnet Association
    └── Virtual Machine (azure-vm-project-v2-vm)
        └── Network Interface
```

For detailed architecture information, see [ARCHITECTURE.md](ARCHITECTURE.md).

---

## 🚀 Quick Start Guide

### **Prerequisites**

Before you begin, ensure you have the following installed and configured:

- ✅ **Azure CLI** - for Azure authentication and management
- ✅ **Terraform** - for infrastructure provisioning
- ✅ **Ansible** - for configuration management (manual deployment only)
- ✅ **Git** - for version control and repository management

### **Manual Deployment**

#### **Step 1: Clone and Setup**
```bash
# Clone the repository
git clone <repository-url>
cd azure-terraform-vm

# Copy and configure variables
cp terraform.tfvars.example terraform.tfvars
# Edit terraform.tfvars with your Azure credentials and preferences
```

#### **Step 2: Deploy Infrastructure**
```bash
# Initialize Terraform
terraform init

# Review the deployment plan
terraform plan

# Apply the infrastructure
terraform apply
```

#### **Step 3: Deploy Application**
```bash
# Navigate to Ansible directory
cd ansible

# Run Ansible playbook
ansible-playbook -i inventory.ini site.yml
```

### **Automated Deployment (GitHub Actions)**

1. **Fork this repository** to your GitHub account
2. **Set up GitHub secrets** (see [GITHUB_SECRETS_SETUP.md](GITHUB_SECRETS_SETUP.md))
3. **Push to main branch** to trigger automated deployment
4. **Monitor the workflow** in GitHub Actions tab

---

## 📸 Project Screenshots

### **Project Structure**
![Project Structure](screenshots/01-project-structure.png)

### **Terraform Deployment**
![Terraform Deployment](screenshots/02-terraform-deployment.png)

### **Azure Resources**
![Azure Resources](screenshots/03-azure-resources.png)

### **Network Security Group Rules**
![NSG Rules](screenshots/04-nsg-rules.png)

### **Ansible Deployment**
![Ansible Deployment](screenshots/05-ansible-deployment.png)

### **Website Deployment**
![Website Live](screenshots/06-website-live.png)

### **Terraform Outputs**
![Terraform Outputs](screenshots/07-terraform-outputs.png)

### **GitHub Actions Workflow**
![GitHub Actions Workflow](screenshots/08-workflow-run-github.png)

---

## ⚙️ Configuration

### **Terraform Variables**

| Variable | Description | Default | Required |
|----------|-------------|---------|----------|
| `subscription_id` | Azure subscription ID | - | ✅ |
| `client_id` | Service principal client ID | - | ✅ |
| `client_secret` | Service principal client secret | - | ✅ |
| `tenant_id` | Azure tenant ID | - | ✅ |
| `location` | Azure region | "East US" | ❌ |
| `project_name` | Project name for resource naming | - | ✅ |
| `resource_group_name` | Resource group name | - | ✅ |
| `vm_size` | VM size | "Standard_B1s" | ❌ |
| `admin_username` | Admin username for VM | - | ✅ |
| `admin_ssh_public_key` | SSH public key for VM access | - | ✅ |

### **Ansible Configuration**

| Component | File | Purpose |
|-----------|------|---------|
| **Inventory** | `ansible/inventory.ini` | Defines target hosts |
| **Playbook** | `ansible/site.yml` | Main configuration tasks |
| **Files** | `ansible/files/index.html` | Static website content |

---

## 🔒 Security Features

### **Authentication & Access Control**
- 🔐 **SSH Key Authentication** - Secure access to VM without passwords
- 🔐 **Azure Service Principal** - Secure Terraform authentication
- 🔐 **Azure CLI Integration** - Seamless credential management

### **Network Security**
- 🛡️ **Network Security Groups** - Firewall rules for ports 22 (SSH) and 80 (HTTP)
- 🛡️ **Private Subnet** - VM deployed in private subnet with public IP
- 🛡️ **No Password Authentication** - SSH password authentication disabled

### **Data Protection**
- 🔒 **Encrypted Storage** - VM disks are encrypted at rest
- 🔒 **Secure Key Management** - SSH keys managed securely
- 🔒 **No Hardcoded Secrets** - All secrets managed via environment variables

### **Operational Security**
- 🚀 **Idempotent Deployments** - Safe to run multiple times
- 🚀 **Automated Security Updates** - Regular system updates
- 🚀 **Audit Trail** - Complete deployment history via Terraform state

---

## 💰 Cost Optimization

### **Monthly Cost Breakdown (B1s VM)**
- **Virtual Machine**: ~$10-15/month
- **Storage**: ~$1-2/month  
- **Network**: ~$1-2/month
- **Total Estimated**: ~$12-19/month

### **Cost Optimization Strategies**
- ✅ **Use B1s VM** - Smallest size for development/demo
- ✅ **Delete when not needed** - Destroy resources after testing
- ✅ **Monitor usage** - Track costs in Azure portal
- ✅ **Use spot instances** - For non-critical workloads
- ✅ **Reserved instances** - For long-term usage

### **Cost Management Tips**
- Set up Azure budget alerts
- Use Azure Cost Management tools
- Consider Azure Dev/Test subscription benefits
- Implement auto-shutdown policies

---

## 🐛 Troubleshooting Guide

### **Common Issues & Solutions**

#### **1. SSH Connection Failed**
```bash
# Check SSH key configuration
ssh-keygen -t rsa -b 4096 -C "your_email@example.com"

# Test SSH connection
ssh azureuser@<VM_PUBLIC_IP> -i ~/.ssh/id_rsa
```

#### **2. Website Not Accessible**
```bash
# Check NGINX status
sudo systemctl status nginx

# View NGINX logs
sudo tail -f /var/log/nginx/access.log
sudo tail -f /var/log/nginx/error.log

# Check firewall rules
sudo ufw status
```

#### **3. Terraform Errors**
```bash
# Check Azure credentials
az account show

# Validate Terraform configuration
terraform validate

# Check Terraform state
terraform show
```

#### **4. Ansible Failures**
```bash
# Test SSH connectivity
ansible all -i inventory.ini -m ping

# Run with verbose output
ansible-playbook -i inventory.ini site.yml -vvv
```

### **Debug Commands**
```bash
# Check VM status
terraform show

# Get VM public IP
terraform output public_ip_address

# Check NGINX status
sudo systemctl status nginx

# View system logs
sudo journalctl -u nginx -f
```

---

## 📚 Learning Outcomes

This project demonstrates essential **DevOps and Cloud Computing** concepts:

### **Infrastructure as Code (IaC)**
- ✅ **Terraform** for declarative infrastructure provisioning
- ✅ **Version-controlled** infrastructure configurations
- ✅ **Reproducible** deployments across environments

### **Configuration Management**
- ✅ **Ansible** for automated server configuration
- ✅ **Idempotent** configuration management
- ✅ **Multi-platform** deployment support

### **Cloud Infrastructure**
- ✅ **Azure** cloud platform integration
- ✅ **Virtual networking** and security
- ✅ **Resource management** and optimization

### **CI/CD Automation**
- ✅ **GitHub Actions** for automated workflows
- ✅ **Continuous deployment** pipelines
- ✅ **Automated testing** and validation

### **Security Best Practices**
- ✅ **SSH key authentication** for secure access
- ✅ **Network security groups** for firewall management
- ✅ **Encrypted storage** and secure communications

### **Web Server Deployment**
- ✅ **NGINX** web server configuration
- ✅ **Static content** deployment
- ✅ **Service management** and monitoring

### **DevOps Workflows**
- ✅ **Automated deployment** processes
- ✅ **Multi-platform support** (Windows/Linux/macOS)
- ✅ **Comprehensive documentation** and guides

---

## 🤝 Contributing

We welcome contributions! Here's how you can help:

### **Getting Started**
1. **Fork the repository**
2. **Create a feature branch**: `git checkout -b feature/amazing-feature`
3. **Make your changes** and test thoroughly
4. **Commit your changes**: `git commit -m 'Add amazing feature'`
5. **Push to the branch**: `git push origin feature/amazing-feature`
6. **Submit a pull request**

### **Contribution Guidelines**
- ✅ Follow existing code style and conventions
- ✅ Add tests for new functionality
- ✅ Update documentation as needed
- ✅ Ensure all tests pass before submitting
- ✅ Provide clear commit messages

### **Development Setup**
```bash
# Clone your fork
git clone https://github.com/your-username/azure-terraform-vm.git

# Add upstream remote
git remote add upstream https://github.com/original-owner/azure-terraform-vm.git

# Create feature branch
git checkout -b feature/your-feature-name
```

---


## 👨‍💻 Author

**Himanshu Gandhi**
- 🌐 **GitHub**: [@himanshu3024](https://github.com/himanshu3024)
- 📧 **Email**: [Contact via GitHub](https://github.com/himanshu3024)
- 🔗 **LinkedIn**: [Connect on LinkedIn](https://linkedin.com/in/himanshu-gandhi-891204160)

### **About the Author**
- **DevOps Engineer** with expertise in cloud infrastructure
- **Infrastructure as Code** specialist using Terraform and Ansible
- **Cloud Computing** enthusiast focused on Azure and AWS
- **Open Source** contributor and community advocate

---

## 🏷️ Tags & Keywords

`#Azure` `#Terraform` `#Ansible` `#DevOps` `#InfrastructureAsCode` `#CloudComputing` `#IaC` `#Automation` `#NGINX` `#Ubuntu` `#GitHubActions` `#CI/CD` `#VirtualMachine` `#WebServer` `#Security` `#Networking`

---

## 📚 Additional Resources

### **Documentation**
- 📖 [ARCHITECTURE.md](ARCHITECTURE.md) - Detailed architecture documentation
- 🔧 [GITHUB_SECRETS_SETUP.md](GITHUB_SECRETS_SETUP.md) - GitHub Actions setup guide

### **Related Projects**
- 🔗 [Azure Terraform Examples](https://github.com/Azure/terraform-azurerm-examples)
- 🔗 [Ansible Best Practices](https://docs.ansible.com/ansible/latest/user_guide/playbooks_best_practices.html)
- 🔗 [Terraform Documentation](https://www.terraform.io/docs)

### **Learning Resources**
- 📚 [Azure Documentation](https://docs.microsoft.com/azure/)
- 📚 [Terraform Documentation](https://www.terraform.io/docs)
- 📚 [Ansible Documentation](https://docs.ansible.com/)

---

## ⭐ Star History

If this project helped you, please consider giving it a ⭐ star on GitHub!

[![Star History Chart](https://api.star-history.com/svg?repos=himanshu3024/azure-terraform-vm&type=Date)](https://star-history.com/#himanshu3024/azure-terraform-vm&Date)

---

**🎉 Thank you for exploring this project! Feel free to reach out with questions or contributions.**
