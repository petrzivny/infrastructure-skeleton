variable "gcp_project_id" {
  description = "Id of the root GCP project."
  type        = string
}

variable "app_name" {
  description = "Name of application/workload."
  type        = string
}

variable "app_environment" {
  description = "Environment of application/workload."
  type        = string
}

variable "app_k8_namespace" {
  description = "Which kubernetes namespace this application/workload will be placed in."
  type        = string
}

variable "app_k8_service_account_name" {
  description = "Name of the kubernetes service account used to access GCP service account which grants access to GCP secrets."
  type        = string
}

variable "cloud_sql_database_private_ip" {
  description = "Private IP address of database."
  type        = string
}

variable "cloud_sql_database_id" {
  description = "Id of shared main cloud SQL database."
  type        = string
}

variable "database_user" {
  description = "Name of the user which app will use to access shared main cloud SQL database."
  type        = string
}

variable "database_password" {
  description = "Password of the user which app will use to access shared main cloud SQL database."
  type        = string
}
