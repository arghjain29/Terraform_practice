# Terraform Practice

This repository contains Terraform practice code for provisioning AWS infrastructure.

## Table of Contents

- [Repository Overview](#repository-overview)
- [create_ec2](#create_ec2)
- [create_vpc](#create_vpc)
- [Remote_State_Locking_S3_DynamoDB](#remote_state_locking_s3_dynamodb)
- [Usage](#usage)
- [Notes](#notes)

## Repository Overview

This repo keeps multiple Terraform practice examples side by side. Earlier samples are intentionally left in place as commented code so they can be revisited while learning.

## create_ec2

The `create_ec2` configuration currently provisions:
- An EC2 instance (Amazon Linux 2 AMI, latest) via a local module (`create_ec2/ec2-module`).

Commented examples in `create_ec2/main.tf` include:
- A basic EC2 instance example
- Variable-based EC2 setup
- Conditional expressions and `locals`
- `depends_on` with an S3 bucket example
- A module-based EC2 example, which is the active configuration

### Files

- `create_ec2/main.tf` – Provider, data source, and module invocation
- `create_ec2/variables.tf` – Input variables with defaults
- `create_ec2/output.tf` – Commented top-level outputs from earlier examples
- `create_ec2/ec2-module/` – Module that creates the EC2 instance

### Variables

- `aws_region`: `ap-south-1`
- `instance_type`: `t3.micro`
- `instance_name`: `my-ec2`
- `bucket_name`: `my-s3bucket-terraform2004` (used by commented examples)

### Outputs

- `instance_id` (exposed by the `ec2-module`)

### How to run

From `create_ec2`:

1. `terraform init`
2. `terraform plan`
3. `terraform apply`
4. `terraform destroy` to clean up

## create_vpc

The `create_vpc` configuration currently provisions:
- A VPC using the `terraform-aws-modules/vpc/aws` module
- Public and private subnets across three availability zones
- NAT gateway and VPN gateway enabled

### Files

- `create_vpc/main.tf` – Provider and VPC module configuration
- `create_vpc/variables.tf` – AWS region variable

### Variables

- `aws_region`: `ap-south-1`

### Outputs

- No top-level outputs are defined in `create_vpc` yet

### How to run

From `create_vpc`:

1. `terraform init`
2. `terraform plan`
3. `terraform apply`
4. `terraform destroy` to clean up

## Remote_State_Locking_S3_DynamoDB

The `Remote_State_Locking_S3_DynamoDB` configuration currently provisions:
- An S3 bucket for Terraform remote state storage
- A DynamoDB table for state locking
- An EC2 instance that uses the remote backend configuration

### Files

- `Remote_State_Locking_S3_DynamoDB/main.tf` – EC2 instance example
- `Remote_State_Locking_S3_DynamoDB/backend.tf` – S3 backend configuration for remote state
- `Remote_State_Locking_S3_DynamoDB/backend-setup/` – Helper configuration that creates the S3 bucket and DynamoDB table

### Variables

- `aws_region`: `ap-south-1`
- `bucket_name`: `terraform-state-bucket3242342`
- `environment`: `dev`
- `lock_table_name`: `terraform-locks`

### Outputs

- `s3_bucket_name`
- `dynamodb_table_name`

### How to run

From `Remote_State_Locking_S3_DynamoDB`:

1. Run the `backend-setup` configuration first so the S3 bucket and DynamoDB table exist.
2. Then run `terraform init` in `Remote_State_Locking_S3_DynamoDB`.
3. Run `terraform plan`.
4. Run `terraform apply`.
5. Use `terraform destroy` to clean up the EC2 example when needed.

#### backend-setup

The `backend-setup` folder is used to create the resources needed by the remote backend before the main configuration can store state in S3 and use DynamoDB locking.

##### Files

- `Remote_State_Locking_S3_DynamoDB/backend-setup/main.tf` – Creates the S3 bucket and DynamoDB table
- `Remote_State_Locking_S3_DynamoDB/backend-setup/variable.tf` – Input variables for the backend resources
- `Remote_State_Locking_S3_DynamoDB/backend-setup/outputs.tf` – Bucket and table name outputs

##### Variables

- `aws_region`: `ap-south-1`
- `bucket_name`: `terraform-state-bucket3242342`
- `environment`: `dev`
- `lock_table_name`: `terraform-locks`

##### Outputs

- `s3_bucket_name`
- `dynamodb_table_name`

##### How to run

From `Remote_State_Locking_S3_DynamoDB/backend-setup`:

1. `terraform init`
2. `terraform plan`
3. `terraform apply`
4. `terraform destroy` if you want to remove the backend resources

## Usage

Use the commands above from the folder you want to work on.

## Notes

- Several earlier Terraform examples are kept commented in `create_ec2/main.tf` for learning/reference, including the S3 bucket example and `depends_on` usage.
- The remote-state example uses an S3 backend plus DynamoDB locking, so the backend resources must exist before the main configuration is initialized.
- Ensure AWS credentials are configured in your environment before running Terraform.
