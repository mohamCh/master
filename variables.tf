variable "region" {
  description = "La région AWS dans laquelle déployer la VPC"
  type        = string
  default     = "us-west-2"
}


variable "vpc_cidr_block" {
  description = "Le bloc CIDR du VPC"
  type        = string
  default     = "20.0.0.0/16"
}

variable "subnet_cidr_block" {
  description = "Le bloc CIDR du sous-réseau"
  type        = list(any)
  default     = ["20.0.1.0/24", "20.0.2.0/24", "20.0.3.0/24"]
}

variable "nombre" {

  description = "Incrémentation"
  type        = number
  default     = 1
}
