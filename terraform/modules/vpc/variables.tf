variable "vpc_cidr" {}

variable "vpc_name" {}

variable "public_subnet_cidrs" {}

variable "private_subnet_cidrs" {

}
variable "azs" {}

variable "tags" {
  default = {}
  type    = map(string)
}

