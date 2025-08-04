variable "region" {}

# ec2 instance
variable "ami" {}
variable "instance_type" {}
variable "key_name" {}
variable "provision_file" {}
variable "user_data" {
  default = ""
}


# security group
variable "ingress_rules" {
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
}

variable "egress_rules" {
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
}


# vpc
variable "vpc_name" {}
variable "vpc_cidr" {}
variable "public_subnet_cidrs" {}
variable "private_subnet_cidrs" {}
variable "azs" {}

# eks
variable "cluster_name" {}
variable "eks_instance_type" {}

variable "eks_node_groups" {
  type = map(object({
    instance_types = list(string)
    capacity_type  = string
    scaling_config = object({
      desired_size = number
      max_size     = number
      min_size     = number
    })
  }))
}