terraform {
    required_providers {
        aws = {
        source  = "hashicorp/aws"
        version = "~> 3.0"
        }
    }
    
    required_version = ">= 0.12"

}

provider "aws" {
  region = "ap-south-1"
}


data "aws_vpc" "name" {
  tags = {
    Name = "my-vpc"
  }
}


data "aws_subnet" "name" {
  vpc_id = data.aws_vpc.name.id
  tags = {
    Name = "Private Subnet"
  }
}

data "aws_security_group" "name" {
  vpc_id = data.aws_vpc.name.id
  tags = {
    Name ="Security"
  }
}

resource "aws_instance" "name" {
    ami = "ami-0f918f7e67a3323f0"
    instance_type = "t2.micro"
    tags = {
        Name = "MyInstance"
    }
    subnet_id = data.aws_subnet.name.id
    security_groups = [data.aws_security_group.name.id]

  
}