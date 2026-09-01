variable "aws_region" {
    description = "AWS region to create resources in"
    default     = "ap-south-1"
}
variable "bucket_name" {
    description = "Name of the S3 bucket for Terraform state"
    default     = "terraform-state-bucket3242342"
}
variable "environment" {
    description = "Environment name"
    default     = "dev"
}
variable "lock_table_name" {
    description = "Name of the DynamoDB table for Terraform locks"
    default     = "terraform-locks"
}