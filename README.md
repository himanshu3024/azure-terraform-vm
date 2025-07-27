# 🌐 Azure VM + Terraform + Ansible Project

This project demonstrates how to create an Azure Virtual Machine using **Terraform**, and then configure it using **Ansible** to serve a simple static website using **NGINX**.

---

## 🚀 What This Project Does

1. **Creates a virtual machine** in Azure using Terraform
2. **Configures the VM** using Ansible to:
   - Install NGINX
   - Copy a static index.html file
   - Start the NGINX web server
3. 🎯 **Result**: You can view the static website using the public IP of your VM

---

## 📁 Project Structure

```
azure-terraform-vm/
├── terraform/              # Terraform configuration to create VM and networking
│   ├── main.tf             # Main Terraform configuration
│   ├── variables.tf        # Input variables
│   ├── outputs.tf          # Output values (like public IP)
│   └── terraform.tfvars    # Variable values
├── ansible/                # Ansible playbook and inventory
│   ├── site.yml            # Main playbook
│   ├── inventory.ini       # Target IP of the VM
│   └── index.html          # Static webpage
├── .github/                # GitHub workflows (optional)
│   └── workflows/
│       └── deploy.yml      # CI/CD pipeline
├── .gitignore              # Git ignore file
└── README.md               # You are here!
```

---

## 🛠️ Tools Used

- **Terraform** – to provision Azure infrastructure
- **Ansible** – to configure the VM
- **Azure CLI** – to authenticate and manage resources
- **NGINX** – as the web server

---

## 📋 Prerequisites

Before running this project, make sure you have:

- [Azure CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli) installed
- [Terraform](https://www.terraform.io/downloads.html) installed
- [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html) installed
- An active Azure subscription
- SSH key pair generated (`ssh-keygen -t rsa -b 4096`)

---

## ⚙️ How to Run This Project

### 1️⃣ Clone the Repo

```bash
git clone https://github.com/your-username/azure-terraform-vm.git
cd azure-terraform-vm
```

### 2️⃣ Azure Authentication

```bash
# Login to Azure
az login

# Set your subscription (if you have multiple)
az account set --subscription "Your-Subscription-Name"
```

### 3️⃣ Terraform: Create Azure VM

```bash
cd terraform

# Initialize Terraform
terraform init

# Plan the deployment (optional but recommended)
terraform plan

# Apply the configuration
terraform apply
```

This will create the VM and return its public IP address. **Save this IP** - you'll need it for Ansible!

### 4️⃣ Ansible: Configure VM

```bash
cd ../ansible

# Edit inventory.ini and put your VM's public IP
nano inventory.ini

# Run the Ansible playbook
ansible-playbook -i inventory.ini site.yml
```

### 5️⃣ 🌐 View Your Website

Open your browser and go to:
```
http://<your-vm-public-ip>
```

You should see your static HTML page served by NGINX 🎉

---

## ✅ Example Output

After successful deployment, you should see:

```bash
$ terraform apply
...
Apply complete! Resources: 6 added, 0 changed, 0 destroyed.

Outputs:
public_ip_address = "20.123.456.789"
```

```bash
$ ansible-playbook -i inventory.ini site.yml
...
PLAY RECAP ****************************************************
20.123.456.789 : ok=5 changed=4 unreachable=0 failed=0
```

---

## 🧹 Cleanup

To avoid Azure charges, don't forget to destroy the resources when done:

```bash
cd terraform
terraform destroy
```

---

## 🔧 Customization

### Modify the Website Content
Edit `ansible/index.html` to customize your webpage content.

### Change VM Configuration
Modify `terraform/variables.tf` to adjust:
- VM size
- Operating system
- Location/region
- Network settings

### Add More Ansible Tasks
Extend `ansible/site.yml` to install additional software or configurations.

---

## 🚀 Advanced Features

- **CI/CD Pipeline**: GitHub Actions workflow for automated deployment
- **SSL/TLS**: Add Let's Encrypt certificates
- **Load Balancer**: Scale to multiple VMs
- **Monitoring**: Add Azure Monitor integration

---

## 🐛 Troubleshooting

### Common Issues:

1. **SSH Connection Failed**
   - Ensure your SSH key is properly configured
   - Check Network Security Group rules allow SSH (port 22)

2. **Ansible Connection Timeout**
   - Verify the VM is running: `az vm list --output table`
   - Check the public IP in inventory.ini matches Terraform output

3. **Website Not Loading**
   - Ensure NSG allows HTTP traffic (port 80)
   - Check NGINX status: `sudo systemctl status nginx`

---

## 📚 Learning Resources

- [Terraform Azure Provider Documentation](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs)
- [Ansible Documentation](https://docs.ansible.com/)
- [Azure Virtual Machines Documentation](https://docs.microsoft.com/en-us/azure/virtual-machines/)

---

## 👨‍💻 Author

**Himanshu Gandhi**
- GitHub: [@your-username](https://github.com/himanshu3024)


---

## 🤝 Contributing

Contributions, issues, and feature requests are welcome! Feel free to check the [issues page](https://github.com/your-username/azure-terraform-vm/issues).

1. Fork the project
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

---

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

## ❤️ Credits & Inspiration

This project is part of my learning journey in Cloud, DevOps, and Infrastructure as Code. I hope it helps other students and beginners explore the exciting world of cloud automation!

Special thanks to the amazing open-source communities behind Terraform, Ansible, and Azure for making this possible.

---

## 🏷️ Tags

`#Azure` `#Terraform` `#Ansible` `#DevOps` `#InfrastructureAsCode` `#CloudComputing` `#IaC` `#Automation`
