# Challenge 02 — AWS Networking Fundamentals

## 📌 Overview

In this challenge, I built a basic AWS network infrastructure from scratch using Terraform.

Unlike Challenge 01, where the main goal was provisioning an EC2 instance, this challenge focused on understanding how AWS networking components work together to provide internet connectivity to an EC2 instance.

The infrastructure includes a custom VPC, public subnet, Internet Gateway, route table, Security Group, and an EC2 instance running Nginx.

---

## 🏗️ Architecture

```text
                         Internet
                            │
                            │
                    Internet Gateway
                            │
                     0.0.0.0/0
                            │
                      Route Table
                            │
          ┌─────────────────┴─────────────────┐
          │                                   │
          │        VPC — 10.0.0.0/16          │
          │                                   │
          │     Public Subnet — 10.0.1.0/24   │
          │                 │                 │
          │                EC2                │
          │             Ubuntu 22.04          │
          │              t3.micro             │
          │                 │                 │
          │           Security Group          │
          │          ├── HTTP :80             │
          │          └── SSH  :22             │
          │                                   │
          └───────────────────────────────────┘
```

---

## 🧱 Resources Created

The following AWS resources were provisioned using Terraform:

- **VPC**
  - CIDR: `10.0.0.0/16`

- **Public Subnet**
  - CIDR: `10.0.1.0/24`
  - Automatic public IPv4 assignment enabled

- **Internet Gateway**
  - Attached to the custom VPC

- **Route Table**
  - Default route:
    - `0.0.0.0/0 → Internet Gateway`

- **Route Table Association**
  - Associates the public subnet with the public route table

- **Security Group**
  - HTTP `TCP/80` allowed from `0.0.0.0/0`
  - SSH `TCP/22` restricted to my public IP
  - All outbound traffic allowed

- **EC2 Instance**
  - Ubuntu 22.04
  - `t3.micro`
  - Deployed inside the public subnet
  - Uses the custom Security Group
  - Receives a public IPv4 address

---

## 🌐 Networking Concepts

### VPC

The VPC defines the main private network where the AWS resources are deployed.

```text
10.0.0.0/16
```

This CIDR provides the address space used by subnets inside the VPC.

### Subnet

The public subnet uses:

```text
10.0.1.0/24
```

The subnet is a smaller network carved out of the VPC address space.

Public IP assignment is enabled using:

```hcl
map_public_ip_on_launch = true
```

However, assigning a public IP alone does not provide internet connectivity.

### Internet Gateway

An Internet Gateway connects the VPC to the public internet.

The Internet Gateway is attached directly to the VPC.

### Route Table

The public route table contains the following route:

```text
0.0.0.0/0 → Internet Gateway
```

This means traffic that does not match a more specific route can be sent through the Internet Gateway.

AWS automatically provides a local route for communication within the VPC.

Conceptually:

```text
10.0.0.0/16 → local
0.0.0.0/0   → Internet Gateway
```

### Security Group

The Security Group acts as a stateful firewall for the EC2 instance.

Inbound traffic:

```text
TCP/22 → My public IP only
TCP/80 → 0.0.0.0/0
```

Outbound traffic:

```text
All traffic → 0.0.0.0/0
```

Restricting SSH to a single `/32` address prevents the SSH port from being exposed to the entire internet.

---

## ⚙️ Automated Nginx Installation

The EC2 instance uses Terraform `user_data` to automatically install and start Nginx during instance initialization.

```bash
#!/bin/bash

apt-get update -y
apt-get install -y nginx

systemctl enable nginx
systemctl start nginx
```

This means no manual configuration is required after the EC2 instance is provisioned.

After deployment, the Nginx web server can be accessed through:

```text
http://<EC2_PUBLIC_IP>
```

---

## 📤 Terraform Outputs

The configuration exposes useful information after deployment:

```text
vpc_id
subnet_id
instance_id
public_ip
```

Example:

```bash
terraform output
```

---

## 🚀 Deployment

Initialize Terraform:

```bash
terraform init
```

Format the configuration:

```bash
terraform fmt
```

Validate the configuration:

```bash
terraform validate
```

Review the execution plan:

```bash
terraform plan
```

Deploy the infrastructure:

```bash
terraform apply
```

Terraform created **7 AWS resources** during this challenge.

After deployment, the EC2 public IP can be used to verify that Nginx is running.

---

## 🧹 Cleanup

To avoid unnecessary AWS costs, destroy the infrastructure after testing:

```bash
terraform destroy
```

---

## 🧠 What I Learned

This challenge helped me understand how different AWS networking components work together instead of treating an EC2 instance as an isolated resource.

Key concepts practiced:

- AWS VPC fundamentals
- IPv4 and CIDR notation
- VPC and subnet address spaces
- Public subnets
- Internet Gateways
- Route tables and default routes
- Route table associations
- Security Groups
- Ingress and egress rules
- Public vs private IP addresses
- Terraform resource dependencies
- Terraform resource references
- EC2 networking
- EC2 initialization using `user_data`

One of the main takeaways from this challenge was understanding that a public IP alone does not make an instance internet-accessible.

Internet connectivity requires multiple components working together:

```text
Public IP
    +
Public Subnet
    +
Route Table
    +
Internet Gateway
    +
Security Group
    =
Internet-accessible EC2
```

---

## 📁 Project Structure

```text
challenge-02/
├── main.tf
├── provider.tf
├── variables.tf
├── outputs.tf
└── README.md
```
