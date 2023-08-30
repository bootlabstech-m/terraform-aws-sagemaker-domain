variable "domain_name" {
  type = string
  description = "value of domain name"
}

variable "auth_mode" {
  type = string
  description = "Authentication mode - either IAM or SSO"
}

variable "vpc_id" {
  type = string
  description = "VPC ID"
}

variable "subnet_ids" {
  type = list(string)
  description = "List of subnet IDs"
}

variable "kms_key_id" {
  type = string
  description = "KMS Key ID"
}

variable "security_group_ids" {
  type = list(string)
  description = "List of security group IDs"
}

variable "instance_type" {
  type = string
  description = "Instance type"
  default = "system"
}

variable "region" {
  type = string
  description = "Region"
  default = "ap-south-1"
}

variable "sagemaker_iam_role_name" {
  type = string
  description = "SageMaker IAM Role Name"
}

variable "role_arn" {
  type = string
  description = "Role ARN"
}