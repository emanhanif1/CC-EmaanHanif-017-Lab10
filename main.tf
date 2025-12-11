provider "aws" {
  shared_config_files      = ["~/.aws/config"]
  shared_credentials_files = ["~/.aws/credentials"]
}

data "aws_vpc" "existing_vpc" {
  default = true
}

resource "aws_vpc" "development_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name   = "development"
  
  }
}

resource "aws_subnet" "dev_subnet_1" {
  vpc_id            = aws_vpc.development_vpc.id
  cidr_block        = "10.0.10.0/24"
  availability_zone = "us-east-1a"
  tags = {
    Name = "subnet-1-dev"
  }
}

resource "aws_subnet" "dev_subnet_1_existing" {
  vpc_id            = data.aws_vpc.existing_vpc.id
  cidr_block        = "172.31.224.0/24"
  availability_zone = "us-east-1a"
  tags = {
    Name = "subnet-1-default"
  }
}
# Basic IDs & ARNs
output "dev-vpc-id" {
  value = aws_vpc.development_vpc.id
}

output "dev-subnet-id" {
  value = aws_subnet.dev_subnet_1.id
}

output "dev-vpc-arn" {
  value = aws_vpc.development_vpc.arn
}

output "dev-subnet-arn" {
  value = aws_subnet.dev_subnet_1.arn
}

# Expanded outputs
output "dev-vpc-cidr_block" {
  value = aws_vpc.development_vpc.cidr_block
}

output "dev-vpc-region" {
  value = aws_vpc.development_vpc.region
}

output "dev-vpc-tags_name" {
  value = aws_vpc.development_vpc.tags["Name"]
}

output "dev-vpc-tags_all" {
  value = aws_vpc.development_vpc.tags_all
}

output "dev-subnet-cidr_block" {
  value = aws_subnet.dev_subnet_1.cidr_block
}

output "dev-subnet-region" {
  value = aws_subnet.dev_subnet_1.availability_zone
}

output "dev-subnet-tags_name" {
  value = aws_subnet.dev_subnet_1.tags["Name"]
}

output "dev-subnet-tags_all" {
  value = aws_subnet.dev_subnet_1.tags_all
}

