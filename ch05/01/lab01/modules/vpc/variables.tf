variable "name" {
  type = string
}

variable "namespace" {
  type = string
  # name = "test"
}

variable "cidr_block" {
  type = string
}

variable "enable_dns_support" {
  type = bool
  default = true  #기본값 true 지정
}

variable "enable_dns_hostnames" {
  type = bool
  default = true  #기본값 true 지정
}