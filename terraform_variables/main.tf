terraform {
    required_providers {
        aws = {
        source  = "hashicorp/aws"
        version = "~> 5.0"
        }
    }
    
    required_version = ">= 1.0"
}

provider "aws" {
    region = "ap-south-1"
}

resource "aws_instance" "name" {
    ami = "ami-0f918f7e67a3323f0"
    instance_type = var.aws_instance_type


root_block_device {
        volume_size = var.ec2_config.v_size
        volume_type = var.ec2_config.v_type
        delete_on_termination = true
    }

    


    tags = merge(var.addition_tags, {
        Name = "MyInstance"
    })
 
}