variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "aws_profile" {
  type    = string
  default = "default"
}

variable "cluster_name" {
  type    = string
  default = "bny-eks-cluster"
}

variable "key_name" {
  type = string
}

variable "my_ip" {
  type = string
  description = "Your current public IP address with /32, e.g. 12.34.56.78/32"
}