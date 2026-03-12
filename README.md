# Terraform Multi-Environment Infrastructure

This repository demonstrates **Terraform Infrastructure as Code (IaC)** using **AWS**, **Terraform modules**, **workspaces**, and **GitHub Actions CI/CD** for multi-environment deployments (dev, staging, prod).

---

## 🚀 Features

- **Multi-environment support** via Terraform **workspaces**  
- **Reusable modules** for EC2 instance provisioning  
- **Remote state management** using **S3 + DynamoDB locking**  
- **Automated CI/CD** with **GitHub Actions**  
- **Code quality checks**: `terraform fmt` and `terraform validate`  
- **Apache web server deployment** on EC2 with styled `index.html`  
- **Prod environment manual approval** in GitHub Actions  

---

## 📁 Project Structure


terraform-multi-env/
├── modules/
│ └── ec2/ # EC2 module
├── environments/ # Terraform configs
│ ├── main.tf
│ ├── backend.tf
│ ├── variables.tf
│ └── terraform.tfvars
├── user-data.sh # EC2 bootstrap script
├── variables.tf
├── outputs.tf
├── provider.tf
└── .github/workflows/terraform.yml # CI/CD pipeline


---

## ⚙️ Prerequisites

- Terraform >= 1.5  
- AWS account with IAM user having permissions: EC2, S3, DynamoDB  
- GitHub repository with secrets:  

```text
AWS_ACCESS_KEY
AWS_SECRET_KEY
🏗️ Usage
1. Initialize Terraform
cd environments
terraform init
2. Create or select workspace
terraform workspace select dev || terraform workspace new dev
terraform workspace select staging || terraform workspace new staging
terraform workspace select prod || terraform workspace new prod
3. Plan
terraform plan -var="ami=<AMI_ID>" -out=tfplan
4. Apply

Dev/Staging: auto-apply

terraform apply -auto-approve tfplan

Prod: requires manual approval in GitHub Actions

✅ CI/CD Workflow

Checkout code

Terraform init

Format check (terraform fmt -check)

Validate configuration (terraform validate)

Terraform plan (terraform plan)

Apply:

Dev/Staging: auto-apply

Prod: manual approval via GitHub Environment

🔗 Notes

Each workspace has its own S3 state file

Adding a new environment is as simple as:

terraform workspace new <environment_name>

Apache server runs on EC2 with a simple styled index.html page