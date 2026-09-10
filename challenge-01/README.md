# Terraform AWS Infrastructure Lab

Hands-on Terraform project focused on building AWS infrastructure from fundamentals to more advanced concepts.

The repository documents my learning path through a series of practical challenges involving Terraform, AWS, networking, infrastructure design, and CI/CD.

## 🧪 Challenges

### Challenge 01 — EC2 Fundamentals ✅

Provision a basic EC2 instance using Terraform.

Concepts covered:

- Terraform AWS Provider
- Resources
- Variables
- Outputs
- Data Sources
- Dynamic AMI lookup
- Provider version constraints
- Terraform dependency references
- Terraform state
- Infrastructure lifecycle

Infrastructure:

```text
Terraform
    │
    ▼
AWS
    │
    └── EC2
         ├── Ubuntu 22.04
         └── t3.micro
```
