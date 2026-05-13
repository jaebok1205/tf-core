variable "service_port" {
  type        = string
  #default     = 80
  description = "Service Port를 넣어주세요."
  validation {
    condition       = 1 <= var.service_port && var.service_port <= 65535
    error_message   = "service_port는 1~65535 값을 사용해야함"
  }
}

variable "cidr_blocks" {
  type        = list(string)
  default     = ["0.0.0.0/0", "10.0.0.0/16"]
}

variable "instance_type" {
  type        = string
  default     = "t3.micro"

  validation {
    condition         = contains(["t3.micro", "t3.small", "t3.medium"], var.instance_type)
    error_message = "instance_type은 t3.micro, t3.small, t3.medium 중 하나여야 한다."
  }
}
