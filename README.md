#  StudentApp – AWS 3-Tier Architecture Using Terraform

##  Project Overview

**StudentApp** is a production-style **3-Tier Web Application** deployed on **AWS** using **Terraform (Infrastructure as Code)**.
The architecture follows AWS best practices for **scalability, availability, and security**.

This project demonstrates real-world DevOps skills including:

* Infrastructure automation
* Load balancing
* Auto Scaling
* Secure networking
* CloudFront CDN
* RDS database provisioning

---

##  Architecture Diagram (Logical)

```
Users
  |

CloudFront (CDN)
  |
Application Load Balancer (ALB)
  |
Auto Scaling Group (Tomcat)
  |
Backend EC2 (Java App)
  |
Amazon RDS (MySQL)
```

---
<img width="1400" height="1535" alt="image" src="https://github.com/user-attachments/assets/56d199e7-fea8-4067-8f6c-1da90778a2fa" />


##  Architecture Components

###  Networking (VPC Layer)

* Custom VPC
* Public Subnets (Multi-AZ)
* Private Subnets
* Internet Gateway
* Route Tables

###  Application Layer

* **Application Load Balancer**
* **Auto Scaling Group**
* **Launch Template**
* **Tomcat Server**
* **Frontend & Backend EC2 Instances**

###  Database Layer

* **Amazon RDS (MySQL)**
* Multi-AZ DB Subnet Group
* Secure DB Security Group

###  Storage & CDN

* **Amazon S3** (Static assets)
* **Amazon CloudFront** (Global content delivery)

---

##  Security Features

* Separate **Security Groups** for:

  * ALB
  * Frontend
  * Backend
  * RDS
* Only required ports are opened:

  * 80 / 443 (HTTP/HTTPS)
  * 8080 (Tomcat internal)
  * 3306 (MySQL – private only)

---

##  Technologies Used

| Technology    | Purpose                |
| ------------- | ---------------------- |
| Terraform     | Infrastructure as Code |
| AWS EC2       | Compute                |
| AWS ALB       | Load Balancing         |
| Auto Scaling  | High Availability      |
| AWS RDS       | Database               |
| AWS S3        | Static Storage         |
| CloudFront    | CDN                    |
| Git & GitHub  | Version Control        |
| Linux         | OS                     |
| Java + Tomcat | Application Runtime    |

---

##  Project Structure

```
studentapp/
├── provider.tf
├── variables.tf
├── network.tf
├── security_groups.tf
├── alb.tf
├── autoscaling.tf
├── backend.tf
├── frontend.tf
├── rds.tf
├── cloudfront.tf
├── outputs.tf
├── .gitignore
└── README.md
```

---

##  Prerequisites

Before running this project, ensure you have:

* AWS Account (Free Tier)
* Terraform >= 1.5
* AWS CLI configured
* Git installed
* AWS EC2 Key Pair created

---

##  Required Variables

Update `terraform.tfvars` or variables accordingly:

```hcl
region       = "ap-south-1"
instance_type = "t3.micro"
key_name     = "your-ec2-keypair"
db_password  = "StudentDB123"
```

 **Note:**
Use only **Free Tier eligible instance types**.

---

##  Deployment Steps

### 1️ Clone Repository

```bash
git clone https://github.com/SindhuPunyamurthi/3-tier-application.git
cd 3-tier-application
```

### 2️ Initialize Terraform

```bash
terraform init
```

### 3️ Validate Configuration

```bash
terraform validate
```

### 4️ Apply Infrastructure

```bash
terraform apply
```

Type `yes` when prompted.

---

##  Destroy Infrastructure (Cleanup)

```bash
terraform destroy
```

---

##  Outputs

After deployment, Terraform outputs:

* ALB DNS Name
* CloudFront URL
* RDS Endpoint

---

##  Key DevOps Learnings

✔ Real-world AWS architecture
✔ Terraform debugging & state management
✔ AWS Free Tier constraints
✔ Security best practices
✔ GitHub repository hygiene

---

##  Future Enhancements

* HTTPS using ACM
* CI/CD using GitHub Actions
* Dockerization
* ECS / EKS migration
* Secrets Manager for DB credentials

---

##  Author

**Sindhu Punyamurthi**
DevOps / Cloud Engineer

## GitHub:##
 [https://github.com/SindhuPunyamurthi](https://github.com/SindhuPunyamurthi)

<img width="1363" height="633" alt="Screenshot 2026-01-06 174443" src="https://github.com/user-attachments/assets/d4c2773e-5c79-4d22-a424-ca75e7a50165" /><img width="1358" height="554" alt="Screenshot 2026-01-06 175107" src="https://github.com/user-attachments/assets/3ca9d3e4-1401-4022-9eb5-e72ed5270db4" />
<img width="1342" height="455" alt="Screenshot 2026-01-06 175923" src="https://github.com/user-attachments/assets/3ea0971f-a45e-4532-8ce6-81cafa290ffe" />
<img width="1341" height="563" alt="Screenshot 2026-01-06 180336" src="https://github.com/user-attachments/assets/7e227794-ddc7-450f-a6e4-09c8b759b8a5" />

<img width="1366" height="768" alt="Screenshot (1)" src="https://github.com/user-attachments/assets/2f04f7ab-3c21-469a-aa43-06514b47c2a0" />
