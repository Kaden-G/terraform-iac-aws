# Terraform AWS Infrastructure

AWS and Terraform project
# Terraform AWS Infrastructure Automation

## Project Overview
This project demonstrates Infrastructure as Code (IaC) using Terraform to provision AWS cloud resources. The goal is to automate the deployment of cloud infrastructure, ensuring consistency, scalability, and version control.

## Features Implemented So Far
- **Local Environment Setup:**
  - Installed Terraform and AWS CLI.
  - Configured AWS credentials securely using `~/.aws/credentials`.
- **AWS Configuration:**
  - Created an **IAM user** with appropriate permissions for Terraform.
  - Verified Access Key ID and Secret Key for authentication.
- **Repository Initialization:**
  - Created a **GitHub repository** for version control.
  - Added a **README.md** with project details.
- **S3 & DynamoDB Setup for Remote State:**
  - Created an **S3 bucket** for Terraform remote state storage.
  - Created a **DynamoDB table** for state locking to prevent conflicts in team environments.
- **Terraform Implementation:**
  - Defined **provider configurations** (AWS region, credentials).
  - Set up **VPC, subnets, and security groups**.
  - Used **Terraform Plan** to validate infrastructure.
  - Addressed duplicate resource creation issues and ensured idempotency.

## Tools & Technologies Used
- **Terraform** for infrastructure as code.
- **AWS CLI** for manual AWS interactions and debugging.
- **GitHub** for version control.
- **S3 & DynamoDB** for remote state management.

## Next Steps
1. **Complete Networking Configuration:**
   - Ensure subnets, NAT gateway, and route tables are configured properly.
2. **Provision EC2 Instances:**
   - Create and configure EC2 instances inside the VPC.
3. **Set Up Load Balancing & Auto Scaling:**
   - Implement an AWS Application Load Balancer (ALB).
   - Configure Auto Scaling Groups for elasticity.
4. **Security Enhancements:**
   - Implement IAM roles and policies.
   - Secure networking with well-defined security group rules.
5. **Deploy Sample Application:**
   - Set up a simple web application to test the infrastructure.

## How to Run This Project
1. Clone the repository:
   ```sh
   git clone https://github.com/your-repo.git
   cd your-repo
   ```
2. Initialize Terraform:
   ```sh
   terraform init
   ```
3. Plan the infrastructure:
   ```sh
   terraform plan
   ```
4. Apply changes to provision resources:
   ```sh
   terraform apply
   ```
5. Verify resources in AWS Console.

## Cost Considerations
- Resources like **S3, IAM users, and DynamoDB** are mostly free-tier eligible.
- **EC2 instances, Load Balancers, and NAT Gateways** may incur charges.
- Run `terraform destroy` after testing to avoid unexpected costs.

## Contributions & Issues
- Feel free to fork, contribute, or raise issues in the repository.

## Acknowledgments
- Inspired by best practices in Terraform and AWS infrastructure automation.
