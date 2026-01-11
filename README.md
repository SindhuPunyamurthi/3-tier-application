
# Java Web Application Deployment on AWS 3-Tier Architecture

## Project Overview

This project demonstrates the deployment of a production-grade Java web application using AWS's robust **3-tier architecture**. The deployment uses Terraform for infrastructure-as-code automation, ensuring high availability, scalability, and security across all application tiers.

The three tiers are:

1. **Presentation Tier** – Frontend EC2 instances behind an **Application Load Balancer (ALB)**.
2. **Application Tier** – Backend EC2 instances managed via an **Auto Scaling Group (ASG)**.
3. **Database Tier** – MySQL database deployed in **RDS** with multi-AZ support.

---

## Technologies Used

- **Java** (backend application)
- **Tomcat** (application server)
- **AWS** (EC2, ALB, RDS, VPC, Subnets, Security Groups)
- **Terraform** (infrastructure provisioning)
- **Maven** (build tool)
- **CloudFront & S3** (for static content distribution)

---

## Prerequisites

1. **AWS Account** (with permissions to create VPC, EC2, RDS, IAM, S3, ALB, etc.)
2. **Terraform >= v1.14**
3. **AWS CLI configured** with your access key, secret key, and default region (`us-east-1` recommended).
4. **Maven** installed for building WAR file:
   ```bash
   mvn clean package
````

5. **SSH Key Pair** for EC2 instances (provide `key_name` in Terraform variables).

---

## Setup Instructions

### 1. Clone the project

```bash
git clone <your-repo-url>
cd studentapp
```

### 2. Configure Terraform Variables

Edit `variables.tf` or `terraform.tfvars`:

```hcl
key_name    = "your-ec2-keypair-name"
ami_id      = "ami-0fc5d935ebf8bc3bc"   # Amazon Linux 2 (us-east-1)
db_password = "YourStrongDBPassword123!"
region      = "us-east-1"
```

### 3. Initialize Terraform

```bash
terraform init
```

### 4. Validate Terraform configuration

```bash
terraform validate
```

### 5. Plan the Terraform deployment

```bash
terraform plan -out plan.tfplan
```

### 6. Apply the Terraform deployment

```bash
terraform apply "plan.tfplan"
```

> Terraform will create VPC, subnets, security groups, ALB, backend and frontend EC2 instances, Auto Scaling Group, RDS, and S3 bucket.

---

## Directory Structure

```
studentapp/
├── alb.tf                 # Application Load Balancer & Target Groups
├── autoscaling.tf         # Auto Scaling Group and Launch Template
├── backend.tf             # Backend EC2 instances
├── frontend.tf            # Frontend EC2 instances
├── network.tf             # VPC, Subnets, IGW, Route Tables
├── rds.tf                 # RDS MySQL Database
├── security_groups.tf     # Security Groups
├── cloudfront.tf          # S3 & CloudFront distribution
├── outputs.tf             # Terraform outputs
├── provider.tf            # AWS provider configuration
├── variables.tf           # Terraform input variables
├── pom.xml                # Maven configuration
├── src/                   # Java application source code
└── target/                # Maven build artifacts
```

---

## Accessing the Application

1. Get the **ALB DNS** from Terraform output:

```bash
terraform output alb_dns
```

2. Open the ALB URL in your browser:

```
http://<alb-dns>/studentapp
```

3. Backend REST endpoints:

```
GET /students
POST /students
```

---

## Important Notes

* **Free Tier Usage:** Make sure to use **t3.micro** instances for EC2 (Free Tier eligible).
* **Database Password:** Must be a strong printable ASCII password (avoid `/ @ " space`).
* **Key Pair:** EC2 instances require an existing AWS key pair (`key_name`).
* **Region:** All AMIs, subnets, and resources must be consistent with the selected AWS region.

---

## Cleanup ##

To destroy all resources created by Terraform:

```bash
terraform destroy -auto-approve


## Author##

Sindhu Punyamurthi

