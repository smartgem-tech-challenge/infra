# Infrastructure

This Terraform configuration deploys a RabbitMQ server and API server on AWS. It provisions EC2 instances with appropriate security groups and auto-generates a secure password for RabbitMQ.

## Installation and Setup

### Requirements

- Terraform
- AWS configured

### Step-by-Step Setup

1. **Clone the repository**:

```bash
git clone https://github.com/smartgem-tech-challenge/infra.git
cd infra
```

2. **Run Terraform**:

```bash
terraform init
terraform plan
terraform apply
```