module "gcp_app_client" {
  source         = "./modules/client"
  gcp_project_id = var.gcp_project_id

  app_name        = "skeleton"
  app_environment = "prod"

  # Which kubernetes namespace this application/workload will be placed in.
  app_k8_namespace = "default"

  # Name of the kubernetes service account which will be used to access GCP service account which grants access to GCP secrets
  app_k8_service_account_name = "gcp-secret-manager-binding-service-account"

  cloud_sql_database_private_ip = google_sql_database_instance.postgres.private_ip_address
  cloud_sql_database_id         = google_sql_database_instance.postgres.id
  database_user                 = var.db_user_name
  database_password             = var.db_user_password
}

