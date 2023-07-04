output "app_gcp_service_account_email" {
  description = "Name of the GCP service account which grants access to GCP secrets."
  value       = module.gcp_app_secret.app_gcp_service_account_email
}

output "app_k8_service_account_name" {
  description = "Name of the kubernetes ServiceAccount used to access GCP service account."
  value       = var.app_k8_service_account_name
}

output "app_k8_namespace" {
  description = "Namespace where kubernetes ServiceAccount should be placed (and the whole application)."
  value       = var.app_k8_namespace
}

output "app_database_name" {
  description = "Name of the created database."
  value       = google_sql_database.app.name
}

output "app_database_user" {
  description = "Username to access app database."
  value       = google_sql_user.app.name
}

output "app_database_password" {
  description = "Password to access app database."
  value       = google_sql_user.app.password
}
