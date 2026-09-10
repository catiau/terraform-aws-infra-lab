# Challenge 02 — AWS Networking

The goal of this challenge was to go beyond a standalone EC2 instance and build the network around it.

I created a custom VPC, public subnet, routing, security rules and an EC2 instance running Nginx.

## What I built

```text
                         Internet
                            │
                     Internet Gateway
                            │
                       Route Table
                     0.0.0.0/0 → IGW
                            │
                VPC — 10.0.0.0/16
                            │
              Public Subnet — 10.0.1.0/24
                            │
                           EC2
                      Ubuntu 22.04
                        t3.micro
                            │
                     Security Group
                    ├── HTTP :80
                    └── SSH  :22
```

The EC2 instance gets a public IP and runs Nginx automatically using `user_data`.

## Networking

This was my first time building the AWS networking around an EC2 instance instead of relying on the default VPC.

The main flow is:

```text
EC2
 │
 ▼
Public Subnet
 │
 ▼
Route Table
 │
 │ 0.0.0.0/0
 ▼
Internet Gateway
 │
 ▼
Internet
```

The VPC uses `10.0.0.0/16`, with a public subnet using `10.0.1.0/24`.

For security, HTTP is open on port `80`, while SSH on port `22` is restricted to my own public IP.

## Nginx

Nginx is installed automatically when the instance starts:

```bash
#!/bin/bash

apt-get update -y
apt-get install -y nginx
systemctl enable nginx
systemctl start nginx
```

After applying the infrastructure, I verified the deployment by accessing the EC2 public IP through the browser.

## What I practiced

- VPCs and subnets
- CIDR notation
- Internet Gateways
- Route tables and routing
- Security Groups
- Ingress and egress rules
- Public and private IPs
- Terraform resource references
- EC2 networking
- EC2 `user_data`

The biggest takeaway from this challenge was understanding that giving an EC2 instance a public IP isn't enough to make it internet-accessible.

The subnet, route table, Internet Gateway and security rules all need to work together.

## Files

```text
challenge-02/
├── main.tf
├── provider.tf
├── variables.tf
├── outputs.tf
└── README.md
```
