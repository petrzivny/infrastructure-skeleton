resource "google_secret_manager_secret" "each" {
  secret_id = "${var.app_name}-${var.app_environment}-${var.secret_name}"
  labels = {
    "app"         = var.app_name
    "environment" = var.app_environment
  }

  replication {
    automatic = true
  }
}

resource "google_secret_manager_secret_version" "each" {
  secret      = google_secret_manager_secret.each.name
  secret_data = var.secret_value
}

resource "google_secret_manager_secret_iam_binding" "each" {
  secret_id = google_secret_manager_secret.each.id
  role      = "roles/secretmanager.secretAccessor"
  members = [
    "serviceAccount:${var.google_service_account_email}",
  ]
}
