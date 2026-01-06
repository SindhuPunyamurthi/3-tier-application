variable "key_name" {
  description = "EC2 key pair name"
  type        = string
}

variable "ami_id" {
  description = "AMI ID for EC2 instances (us-east-1)"
  type        = string
}

variable "db_password" {
  description = "RDS MySQL password"
  type        = string
  sensitive   = true
}

