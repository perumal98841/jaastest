# Configure the AWS Provider
provider "aws" {
  region  = "us-east-1"
}

# Create a VPC
resource "aws_vpc" "example" {
  cidr_block = "10.30.0.0/24"
  tags = {
    Name = "test"
    Owner = "Perumal"
  }
}
