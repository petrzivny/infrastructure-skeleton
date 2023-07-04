#------------------------------------ General Project Variables (for all applications/workloads ---------------------------------------
variable "project_id" {
  description = "Project id."
  type        = string
}

variable "region" {
  description = "The region for the network. If the cluster is regional, this must be the same region. Otherwise, it should be the region of the zone."
  type        = string
  default     = "europe-west1"
}

variable "environment" {
  description = "To access your cluster using kubectl (or Kubernetes API) and to access database."
  type        = string
  default     = "prod"
}

variable "allowing_admin_access_from_ip" {
  description = "To access your cluster using kubectl (or Kubernetes API) and to access database."
  type        = string
  nullable = true
  default = null
}

#--------------------------------------------------- Application Specific Variables ---------------------------------------------------

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
  sensitive = true
}

variable "db_user_password" {
  description = "Database regular user password"
  type        = string
  sensitive = true
}
