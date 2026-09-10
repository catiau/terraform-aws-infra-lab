# ☁️ Terraform AWS Infrastructure Lab

A hands-on Infrastructure as Code lab focused on building AWS infrastructure with Terraform — from core concepts to production-oriented architectures and CI/CD automation.

This repository documents my practical learning journey through progressively more complex infrastructure challenges, covering AWS networking, compute, security, Terraform modules, remote state, CI/CD, and infrastructure automation.

---

## 🎯 Project Goals

The goal of this repository is to strengthen practical skills in:

- Infrastructure as Code (IaC)
- Terraform
- AWS
- Cloud Networking
- Infrastructure Security
- High Availability
- Infrastructure Automation
- CI/CD
- DevOps and SRE practices

Each challenge introduces new concepts while building on knowledge from previous exercises.

---

## 🗺️ Learning Roadmap

| Challenge | Topic | Key Concepts | Status |
|---|---|---|---|
| 01 | EC2 Fundamentals | Provider, Resources, Variables, Data Sources, Outputs | ✅ Completed |
| 02 | AWS Networking | VPC, Subnets, CIDR, Internet Gateway, Route Tables | ⏳ Next |
| 03 | Security & Compute | Security Groups, EC2 networking, User Data | 🔒 Locked |
| 04 | High Availability | Multi-AZ, ALB, Target Groups | 🔒 Locked |
| 05 | Auto Scaling | Launch Templates, ASG, Health Checks | 🔒 Locked |
| 06 | Terraform Modules | Reusable infrastructure components | 🔒 Locked |
| 07 | Remote State | S3 Backend, State Locking, Environments | 🔒 Locked |
| 08 | CI/CD Fundamentals | GitHub Actions, fmt, validate, plan | 🔒 Locked |
| 09 | CI/CD on AWS | OIDC, IAM, automated deployments | 🔒 Locked |
| 10 | Production Infrastructure | Complete highly available AWS architecture | 🔒 Locked |

---

## 🏗️ Repository Structure

```text
terraform-aws-infra-lab/
│
├── challenge-01/
│   ├── main.tf
│   ├── provider.tf
│   ├── variables.tf
│   ├── outputs.tf
│   └── README.md
│
├── challenge-02/
│   └── ...
│
├── .gitignore
└── README.md
