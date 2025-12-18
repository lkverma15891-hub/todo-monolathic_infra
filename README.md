

# todo-monolathic_infra

## 📌 Project Overview
This repository contains **Terraform Infrastructure as Code (IaC)** for provisioning
Azure infrastructure for a **Todo Monolithic Application**.

This project demonstrates real-world DevOps practices including:
- Modular Terraform design
- Azure infrastructure provisioning
- CI/CD pipeline integration
- Infrastructure cost awareness

---

## 🏗️ Azure Resources Used
- Resource Group
- Azure Kubernetes Service (AKS)
- Storage Account
- Public IP
- Modular Terraform components

---

## 📂 Repository Structure
todo-monolathic_infra/
├── Module/
│ ├── resource_group/
│ ├── azurerm_kubernetes_cluster/
│ ├── storage_account/
│ └── Public_ip/
├── environment/
├── pipeline.yaml
├── .gitignore
└── README.md

yaml
Copy code

---

## ⚙️ Prerequisites
- Azure Subscription
- Terraform >= 1.5
- Azure CLI (`az login`)
- Git

---

## 🚀 Terraform Commands
Run the following commands to deploy infrastructure:

```bash
terraform init
terraform validate
terraform plan
terraform apply
🔄 CI/CD Pipeline
The pipeline.yaml file provides CI automation for:

Terraform validation

Infrastructure planning

Ready for cost estimation integration