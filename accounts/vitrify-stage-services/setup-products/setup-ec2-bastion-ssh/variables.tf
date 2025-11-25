variable "aws_region" {
  description = "AWS region to deploy"
  type        = string
}

variable "vpc_id" {
  description = "ID of the VPC"
  type        = string
}

variable "subnet_id" {
  description = "ID of the subnet"
  type        = string
}

variable "instance_name" {
  description = "Name of the bastion instance"
  type        = string
}

variable "ami" {
  description = "AMI ID for EC2"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "keypair_name" {
  description = "Name of the EC2 key pair"
  type        = string
}

variable "iam_profile_name" {
  description = "Name of IAM instance profile (SSM)"
  type        = string
}

variable "volume_type" {
  description = "Root volume type"
  type        = string
  default     = "gp3"
}

variable "volume_size" {
  description = "Root volume size (GiB)"
  type        = number
  default     = 250
}

variable "volume_encrypted" {
  description = "Whether the root volume should be encrypted"
  type        = bool
  default     = true
}

variable "volume_delete_on_termination" {
  description = "Whether to delete volume on instance termination"
  type        = bool
  default     = true
}
