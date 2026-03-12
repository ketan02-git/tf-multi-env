variable "ami" {
  description = "Ubuntu AMI"
  type        = string
}

variable "instance_type" {
  description = "EC2 type"
  type        = string
  default     = "t2.micro"
}

variable "instance_name" {
  type = string
}

variable "environment" {
  type = string
}