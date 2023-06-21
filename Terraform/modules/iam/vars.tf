variable "effect" {
  type        = string
  description = "IAM policy effect"
}

variable "actions" {
  type        = list(string)
  description = "IAM policy effect"
}

variable "principal_type" {
  type        = string
  description = "IAM principal type"
}

variable "principal_identifiers" {
  type        = list(string)
  description = "IAM policy principal identifiers"
}

variable "role_name" {
  type        = string
  description = "IAM role name"
}

variable "policy_arn" {
  type        = string
  description = "IAM policy arn for attachment"
}