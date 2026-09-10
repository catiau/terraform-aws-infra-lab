# Terraform AWS Infrastructure Lab

A repository I'm using to practice Terraform and AWS by building infrastructure from scratch.

The idea is simple: start with the basics and gradually move into networking, high availability, modules, remote state and CI/CD.

## Challenges

| # | Challenge | Status |
|---|---|---|
| 01 | EC2 Fundamentals | ✅ |
| 02 | AWS Networking | ✅ |
| 03 | Security & Compute | ⏳ |
| 04 | High Availability | |
| 05 | Auto Scaling | |
| 06 | Terraform Modules | |
| 07 | Remote State | |
| 08 | CI/CD with GitHub Actions | |
| 09 | AWS CI/CD with OIDC | |
| 10 | Production Infrastructure | |

Each challenge has its own README with notes about what I built and what I learned along the way.

## What I've worked with so far

**Terraform**
- Providers and resources
- Variables and outputs
- Data sources
- Resource references and dependencies

**AWS**
- EC2
- VPC
- Subnets and CIDR
- Internet Gateway
- Route Tables
- Security Groups

More to come as I progress through the challenges.

## Repository

```text
terraform-aws-infra-lab/
├── challenge-01/
├── challenge-02/
├── challenge-03/
├── .gitignore
└── README.md
```

## Why this repo?

I'm using this project to get more comfortable with infrastructure and cloud concepts through hands-on practice rather than just studying the theory.

Every challenge adds something new to the previous one, so the infrastructure gets more realistic as the project evolves.
