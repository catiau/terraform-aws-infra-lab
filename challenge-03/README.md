# Challenge 03 — Security & Load Balancing

The goal of this challenge was to introduce load balancing and improve how traffic reaches the EC2 instance.

Instead of exposing the application directly, HTTP traffic now goes through an Application Load Balancer.

## What I built

```text
                    Internet
                       │
                       ▼
              Application Load
                 Balancer :80
                  /         \
                 /           \
          Subnet A           Subnet B
         us-east-1a         us-east-1b
                 \
                  ▼
              Target Group
                  │
                  ▼
                 EC2
               Nginx :80
```

The ALB is deployed across two Availability Zones and forwards HTTP traffic to the EC2 instance through a Target Group.

## Security

I used separate Security Groups for the ALB and EC2.

```text
Internet
   │
   │ HTTP :80
   ▼
ALB Security Group
   │
   │ HTTP :80
   ▼
EC2 Security Group
```

The ALB accepts HTTP traffic from the internet, while the EC2 only accepts HTTP traffic coming from the ALB Security Group.

## Load Balancing

The ALB listens on port `80` and forwards requests to the Target Group.

The Target Group performs health checks on `/` to make sure the Nginx instance is available before sending traffic to it.

After applying the infrastructure, I verified the deployment by accessing the ALB DNS name through the browser.

## What I practiced

- Multiple Availability Zones
- Application Load Balancers
- Target Groups
- Listeners
- Health Checks
- Security Group references
- ALB to EC2 traffic flow
- Terraform resource dependencies

## Files

```text
challenge-03/
├── main.tf
├── provider.tf
├── variables.tf
├── outputs.tf
└── README.md
```
