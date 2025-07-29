variable "aws_instance_type" {
  description = "what type of instance you want to create"
  type = string
  validation {
    condition = var.aws_instance_type == "t2.micro" || var.aws_instance_type == "t2.small" || var.aws_instance_type == "t2.medium"
    error_message = "value must be one of the following: t2.micro, t2.small, or t2.medium"
  }
}

# variable "root_volume_size" {
#   description = "Size of the root volume in GB"
#   type = number
# }

# variable "volume_type" {
#     description = "enter the type of volume you want to create"
#     type = string
# }

# to combine two variables into one
variable "ec2_config" {
    type = object({
      v_type = string
      v_size = number
    })
  default = {
    v_size = 10
    v_type = "gp2"
  }
}

variable "addition_tags" {
    description = "enter any additional tags you want to add to the instance"
    type = map(string) //it is expecting a key-value pair
    default = {}
}