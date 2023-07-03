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

output "gcp_repository" {
  description = "Full repository path to be used in Helm values.yaml in image.repository variable."
  value       = "${google_artifact_registry_repository.main.location}-${lower(google_artifact_registry_repository.main.format)}.pkg.dev/${google_artifact_registry_repository.main.project}/${google_artifact_registry_repository.main.name}"
}
