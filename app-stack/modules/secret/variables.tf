variable "app_name" {
  description = "Name of application/workload."
  type        = string
}

variable "app_environment" {
  description = "Environment of application/workload."
  type        = string
}

variable "google_service_account_email" {
  description = "Email for workload identity service account."
  type        = string
}

variable "secret_name" {
  description = "Name of the secret in Secret Manager"
  type        = string
}

variable "secret_value" {
  description = "Value of the secret in first version."
  type        = string
}
