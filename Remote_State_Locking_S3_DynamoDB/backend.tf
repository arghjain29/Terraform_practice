terraform {
    backend "s3" {
        bucket         = "terraform-state-bucket3242342"
        key            = "dev/project/terraform.tfstate"
        region         = "ap-south-1"
        dynamodb_table = "terraform-locks"
        encrypt        = true
    }
}