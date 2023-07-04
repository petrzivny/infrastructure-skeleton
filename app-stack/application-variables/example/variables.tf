variable "app_k8_namespace" {
  description = "Which kubernetes namespace this application/workload will be placed in."
  type        = string
  default     = "default"
}

variable "app_k8_service_account_name" {
  description = "Name of the kubernetes service account used to access GCP service account which grants access to GCP secrets."
  type        = string
  default     = "mypodserviceaccount"
}

variable "db_user_name" {
  description = "Database regular user name"
  type        = string
}

variable "db_user_password" {
  description = "Database regular user password"
  type        = string
}
