output "secret" {
  description = "Name of the GCP service account which grants access to GCP secrets."
  value       = google_secret_manager_secret.each.secret_id
}
