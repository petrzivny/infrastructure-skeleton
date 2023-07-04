output "app_gcp_service_account_email" {
  description = "Name of the GCP service account which grants access to GCP secrets."
  value       = google_service_account.main.email
}

output "app_k8_service_account_name" {
  description = "Name of the kubernetes ServiceAccount used to access GCP service account."
  value       = var.app_k8_service_account_name
}

output "app_k8_namespace" {
  description = "Namespace where kubernetes ServiceAccount should be placed (and the whole application)."
  value       = var.app_k8_namespace
}

output "secrets" {
  value = {
    for key, value in local.variable_mapping : key => "(fetch it directly from Secret Manager)"
  }
}
