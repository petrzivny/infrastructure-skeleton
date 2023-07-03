module "gcp_app_secret" {
  source         = "../secret"
  gcp_project_id = var.gcp_project_id

  app_name        = var.app_name
  app_environment = var.app_environment

  # Which kubernetes namespace this application/workload will be placed in.
  app_k8_namespace = var.app_k8_namespace

  # Name of the kubernetes service account which will be used to access GCP service account which grants access to GCP secrets
  app_k8_service_account_name = var.app_k8_service_account_name

  db_host_private_ip = var.cloud_sql_database_private_ip
  db_name            = google_sql_database.app.name
  db_user            = google_sql_user.app.name
  db_password        = google_sql_user.app.password
}
