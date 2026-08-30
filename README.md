# Terraform Practice

This repository contains Terraform practice code for provisioning AWS infrastructure.

## What it creates

The `create_ec2` configuration currently provisions:
- An EC2 instance (Amazon Linux 2 AMI, latest) via a local module (`create_ec2/ec2-module`).

Note: Several example configurations (S3 bucket, `depends_on`, locals/conditional expressions, and other earlier variants) are kept commented in `create_ec2/main.tf` for practice — they are not removed from the repository.

## Project structure

- `create_ec2/main.tf` – Provider, data source, and module invocation
- `create_ec2/variables.tf` – Input variables with defaults
- `create_ec2/output.tf` – (currently commented) top-level outputs
- `create_ec2/ec2-module/` – Module that creates the EC2 instance

## Variables (defaults)

- `aws_region`: `ap-south-1`
- `instance_type`: `t3.micro`
- `instance_name`: `my-ec2`
-- `bucket_name`: `my-s3bucket-terraform2004` (present in `variables.tf` and used by commented examples)

## Outputs

- `instance_id` (exposed by the `ec2-module`)

## Usage

From `create_ec2`:

1. `terraform init`
2. `terraform plan`
3. `terraform apply`

To clean up:

- `terraform destroy`

## Notes

- Several earlier Terraform examples are kept commented in `create_ec2/main.tf` for learning/reference (including an S3 bucket example and `depends_on` usage). These examples are intentionally retained for practice and are not removed.
- Ensure AWS credentials are configured in your environment before running Terraform.
