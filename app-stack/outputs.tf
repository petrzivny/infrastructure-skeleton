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



output "app_gcp_service_account_name" {
  description = "Name of the GCP service account which grants access to GCP secrets. Used in metadata.annotations.iam.gke.io/gcp-service-account k8 specification of ServiceAccount."
  value       = module.gcp_app_client.app_gcp_service_account_email
}

output "app_k8_service_account_name" {
  description = "Name of the k8 ServiceAccount used to access GCP service account which grants access to GCP secrets. Used in metadata.name."
  value       = module.gcp_app_client.app_k8_service_account_name
}

output "app_k8_namespace" {
  description = "Namespace of the application. To be used in helm `install {helm_name} --namespace {app_k8_namespace}` command."
  value       = module.gcp_app_client.app_k8_namespace
}

output "app_database_name" {
  description = "Name of the created database."
  value       = module.gcp_app_client.app_database_name
}

output "app_database_user" {
  description = "Username to access app database."
  value       = module.gcp_app_client.app_database_user
  sensitive   = true
}

output "app_database_password" {
  description = "Password to access app database."
  value       = module.gcp_app_client.app_database_password
  sensitive   = true
}
