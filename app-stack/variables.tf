#------------------------------------ General Project Variables (for all applications/workloads ---------------------------------------
variable "gcp_project_id" {
  description = "Project id"
  type        = string
  default     = "basic-388908"
}

variable "region" {
  description = "The region for the network. If the cluster is regional, this must be the same region. Otherwise, it should be the region of the zone."
  type        = string
  default     = "europe-west1"
}

variable "zone" {
  description = "Zone of all zonal resources"
  type        = string
  default     = "europe-west1-b"
}

variable "allowing_admin_access_from_ip" {
  description = "To access your cluster using kubectl (or Kubernetes API) and to access database."
  type = string
  default = "89.103.146.188/32"
}

variable "naming_region_code" {
  description = "Region code used in service naming."
  type        = string
  default     = "euwe1"
}

#--------------------------------------------------- Application Specific Variables ---------------------------------------------------
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
