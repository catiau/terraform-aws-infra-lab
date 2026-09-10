# Challenge 01 — EC2 Fundamentals

First challenge of my Terraform AWS lab.

The goal here was simple: use Terraform to provision an EC2 instance from scratch and get familiar with the basic Terraform workflow.

## What I built

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

The AMI is retrieved dynamically instead of being hardcoded:

```hcl
data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }
}
```

## What I practiced

- Configuring the AWS provider
- Creating resources with Terraform
- Using variables and outputs
- Looking up an AMI with a data source
- Referencing Terraform resources
- Understanding the Terraform state
- Running the basic Terraform workflow:

```bash
terraform init
terraform fmt
terraform validate
terraform plan
terraform apply
terraform destroy
```

## Files

```text
challenge-01/
├── main.tf
├── provider.tf
├── variables.tf
├── outputs.tf
└── README.md
```
