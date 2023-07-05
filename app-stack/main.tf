module "gcp_app_client" {
  source   = "./modules/client"
  for_each = var.applications

  gcp_project_id = var.project_id

  app_name        = each.key
  app_environment = each.value.app_environment

  # Which kubernetes namespace this application/workload will be placed in.
  app_k8_namespace = each.key

  # Name of the kubernetes service account which will be used to access GCP service account which grants access to GCP secrets
  app_k8_service_account_name = "gcp-secret-manager-binding-service-account-for-${each.key}-${each.value.app_environment}"

  cloud_sql_database_private_ip = google_sql_database_instance.postgres.private_ip_address
  cloud_sql_database_id         = google_sql_database_instance.postgres.id
  database_user                 = each.value.database_user
  database_password             = each.value.database_password
}

