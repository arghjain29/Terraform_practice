# Terraform Practice

This repository contains Terraform practice code for provisioning AWS infrastructure.

## What it creates

The `create_ec2` configuration currently provisions:
- An EC2 instance (Amazon Linux 2 AMI, latest)
- An S3 bucket

The EC2 instance is configured with an explicit dependency on the S3 bucket.

## Project structure

- `create_ec2/main.tf` – Provider, data source, and AWS resources
- `create_ec2/variables.tf` – Input variables with defaults
- `create_ec2/output.tf` – Output values
- `create_ec2/.gitignore` – Terraform local/state ignore rules

## Variables (defaults)

- `aws_region`: `ap-south-1`
- `instance_type`: `t3.micro`
- `instance_name`: `my-ec2`
- `bucket_name`: `my-s3bucket-terraform2004`

## Outputs

- `instance_id`
- `instance_public_ip`
- `bucket_name`

## Usage

From `create_ec2`:

1. `terraform init`
2. `terraform plan`
3. `terraform apply`

To clean up:

- `terraform destroy`

## Notes

- Several earlier Terraform examples are kept commented in `main.tf` for learning/reference.
- Ensure AWS credentials are configured in your environment before running Terraform.
