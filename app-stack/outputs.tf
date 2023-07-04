output "artifact_registry" {
  description = "Full repository path to be used in Helm values.yaml in image.repository variable."
  value       = "${google_artifact_registry_repository.main.location}-${lower(google_artifact_registry_repository.main.format)}.pkg.dev/${google_artifact_registry_repository.main.project}/${google_artifact_registry_repository.main.name}"
}

#output "loadbalancer_public_ip_address" {
#  description = "Load balancer external IP address to set DNS A record."
#  value       = google_compute_address.loadbalancer_premium.address
#}

output "database_public_ip_address" {
  description = "Public IP to connect to DB. This is only enabled if allowing_admin_access_from_ip is set."
  value       = google_sql_database_instance.postgres.public_ip_address
}

output "project_id" {
  description = "GCP project id."
  value       = google_container_cluster.main.project
}

output "applications" {
  description = "Detailed information for each application."
  value = {
    for key, app in module.gcp_app_client : key =>
    {
      app_gcp_service_account_name : app.app_gcp_service_account_email
      app_k8_namespace : app.app_k8_namespace
      secrets : app.secrets
    }
  }
}
