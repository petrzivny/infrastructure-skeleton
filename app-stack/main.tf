module "gcp_app_client" {
  source         = "./modules/client"
  gcp_project_id = var.project_id

  app_name        = var.app_name
  app_environment = var.app_environment

  # Which kubernetes namespace this application/workload will be placed in.
  app_k8_namespace = "default"
#  app_k8_namespace = var.app_name

  # Name of the kubernetes service account which will be used to access GCP service account which grants access to GCP secrets
  app_k8_service_account_name = "gcp-secret-manager-binding-service-account"

  cloud_sql_database_private_ip = google_sql_database_instance.postgres.private_ip_address
  cloud_sql_database_id         = google_sql_database_instance.postgres.id
  database_user                 = var.db_user_name
  database_password             = var.db_user_password
}

