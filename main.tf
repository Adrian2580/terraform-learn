provider "aws" {
}

variable "subnet_cidr_block" {
  description = "subnet cidr block"
}

variable "vpc_cidr_block" {
  description = "vpc cidr block"
}

variable "envi" {
  description = "env to delpoy"
}

resource "aws_vpc" "development-vpc" {
  cidr_block = var.vpc_cidr_block
  tags = {
    Name: "development",
    vpc_env: var.envi
  }
}

resource "aws_subnet" "dev-subnet-1" {
  vpc_id = aws_vpc.development-vpc.id
  cidr_block = var.subnet_cidr_block
  availability_zone = "eu-central-1a"
  tags = {
    Name: "subnet-1-dev"
  }
}

# output "vpc-id" {
#   value = aws_vpc.development-vpc.id
# }

# output "vpc-subnet-id" {
#   value = aws_subnet.dev-subnet-1.id
# }
