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
  nullable    = true
  default     = null
}

#--------------------------------------------------- Application Specific Variables ---------------------------------------------------

variable "applications" {
  type = map(object({
    app_environment   = string
    database_user     = string
    database_password = string
    #    secrets           = map(object({ value = string }))
  }))
}
