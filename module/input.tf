variable "aws_region" {
  description = "AWS region"
  default     = "us-east-1"
  type        = string
}

variable "key_pair_name" {
  description = "Key pair name"
  type        = string
}

variable "security_group_name" {
  description = "Security group name"
  type        = string
}

variable "aws_instance_name" {
  description = "value of instance name"
  type        = string
}

variable "ami_id" {
  description = "value of ami"
  type        = string
}

variable "instance_type" {
  description = "value of instance type"
  type        = string
}

variable "custom_port" {
  description = "value of custom port"
  type        = number
}

variable "private_key_path" {
  description = "value of private key path"
  type = string
  default = "~/.ssh/id_rsa"
}

variable "public_key_path" {
  description = "value of public key path"
  type = string
  default = "~/.ssh/id_rsa.pub"
}

variable "playbook_file_path" {
  description = "value of playbook file path"
  type = string
}