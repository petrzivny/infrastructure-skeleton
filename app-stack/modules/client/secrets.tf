# Setup the workload identity service account
resource "google_service_account" "main" {
  account_id = "${var.app_name}-${var.app_environment}-gke-workload"
}

resource "google_service_account_iam_binding" "main" {
  service_account_id = google_service_account.main.id
  role               = "roles/iam.workloadIdentityUser"
  members = [
    "serviceAccount:${var.gcp_project_id}.svc.id.goog[${var.app_k8_namespace}/${var.app_k8_service_account_name}]",
  ]
}

module "secret" {
  source = "../secret"
  for_each = {
    DATABASE_HOST = var.cloud_sql_database_private_ip,
    DATABASE_NAME = google_sql_database.app.name,
    DATABASE_USER = google_sql_user.app.name,
    DATABASE_PASSWORD = google_sql_user.app.password,
  }

  app_environment              = var.app_environment
  app_name                     = var.app_name
  google_service_account_email = google_service_account.main.email
  secret_name                  = each.key
  secret_value                 = each.value
}
