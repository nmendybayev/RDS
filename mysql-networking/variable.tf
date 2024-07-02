#Security group variables

variable "env" {
  description = "Environment name."
  type        = string
}
variable "sg-name" {
  type = string
}
# variable "main-vpc-id" {
#   type = string
# }
variable "from_port" {
  type = string
}
variable "to_port" {
  type = string
}
variable "cidr_block_engress" {
  type = list(string)
}
variable "protol_engress" {
  type = string
}
variable "from_port_egress" {
  type = number
}
variable "to_port_egress" {
  type = number
}
variable "protol_egress" {
  type = string
}
variable "cidr_block_egress" {
  type = list(string)
}

# VPC subnet variables

variable "aws_region" {
  type = string
}
variable "subnet_addresses" {
  type = list(string)
}
variable "availability_zone" {
  type = list(string)
}
variable "subnet_group" {
  type = string
}
variable "subnet_group_name" {
  type = string
}