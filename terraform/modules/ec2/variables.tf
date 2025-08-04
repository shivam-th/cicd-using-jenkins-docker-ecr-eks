variable "ami" {}
variable "instance_type" {
  default = "t2.micro"
}
variable "key_name" {}
variable "name" {}
variable "subnet_id" {}
variable "security_group_ids" {
  type = list(string)
}
variable "tags" {
  type    = map(string)
  default = {}
}
variable "user_data" {
  default = ""
}