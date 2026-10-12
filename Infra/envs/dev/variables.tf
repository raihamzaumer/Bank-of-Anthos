#*************************** Variables for Network Module***************************#
variable "name" {
  type = string
}

variable "region" {
  type = string
}

variable "vpc_cidr" {
  type = string
}

variable "public_subnets" {
  type = list(string)
}

variable "private_subnets" {
  type = list(string)
}

variable "database_subnets" {
  type = list(string)
}

variable "single_nat_gateway" {
  type    = bool
  default = true
}
#************************************** variables for ECR Module**************************************#

variable "ecr_repositories" {
  type = list(string)
}

variable "ecr_force_delete" {
  type    = bool
  default = false
}