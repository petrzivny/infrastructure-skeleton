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


# Create a secrets that the workload identity service account can access
#------------------------------------------------------------------------------
resource "google_secret_manager_secret" "DATABASE_HOST" {
  secret_id = "${var.app_name}-${var.app_environment}-DATABASE_HOST"
#  secret_id = "DATABASE_HOST"
  labels = {
    "app"         = var.app_name
    "environment" = var.app_environment
  }

  replication {
    automatic = true
  }
}

resource "google_secret_manager_secret_version" "DATABASE_HOST" {
  secret      = google_secret_manager_secret.DATABASE_HOST.name
  secret_data = var.db_host_private_ip
}

resource "google_secret_manager_secret_iam_binding" "DATABASE_HOST" {
  secret_id = google_secret_manager_secret.DATABASE_HOST.id
  role      = "roles/secretmanager.secretAccessor"
  members = [
    "serviceAccount:${google_service_account.main.email}",
  ]
}
#------------------------------------------------------------------------------

#------------------------------------------------------------------------------
resource "google_secret_manager_secret" "DATABASE_NAME" {
  secret_id = "${var.app_name}-${var.app_environment}-DATABASE_NAME"
#  secret_id = "DATABASE_NAME"
  labels = {
    "app"         = var.app_name
    "environment" = var.app_environment
  }

  replication {
    automatic = true
  }
}

resource "google_secret_manager_secret_version" "DATABASE_NAME" {
  secret      = google_secret_manager_secret.DATABASE_NAME.name
  secret_data = var.db_name
}

resource "google_secret_manager_secret_iam_binding" "DATABASE_NAME" {
  secret_id = google_secret_manager_secret.DATABASE_NAME.id
  role      = "roles/secretmanager.secretAccessor"
  members = [
    "serviceAccount:${google_service_account.main.email}",
  ]
}
#------------------------------------------------------------------------------

#------------------------------------------------------------------------------
resource "google_secret_manager_secret" "DATABASE_USER" {
  secret_id = "${var.app_name}-${var.app_environment}-DATABASE_USER"
#  secret_id = "DATABASE_USER"
  labels = {
    "app"         = var.app_name
    "environment" = var.app_environment
  }

  replication {
    automatic = true
  }
}

resource "google_secret_manager_secret_version" "DATABASE_USER" {
  secret      = google_secret_manager_secret.DATABASE_USER.name
  secret_data = var.db_user
}

resource "google_secret_manager_secret_iam_binding" "DATABASE_USER" {
  secret_id = google_secret_manager_secret.DATABASE_USER.id
  role      = "roles/secretmanager.secretAccessor"
  members = [
    "serviceAccount:${google_service_account.main.email}",
  ]
}
#------------------------------------------------------------------------------

#------------------------------------------------------------------------------
resource "google_secret_manager_secret" "DATABASE_PASSWORD" {
  secret_id = "${var.app_name}-${var.app_environment}-DATABASE_PASSWORD"
#  secret_id = "DATABASE_PASSWORD"
  labels = {
    "app"         = var.app_name
    "environment" = var.app_environment
  }

  replication {
    automatic = true
  }
}

resource "google_secret_manager_secret_version" "DATABASE_PASSWORD" {
  secret      = google_secret_manager_secret.DATABASE_PASSWORD.name
  secret_data = var.db_password
}

resource "google_secret_manager_secret_iam_binding" "DATABASE_PASSWORD" {
  secret_id = google_secret_manager_secret.DATABASE_PASSWORD.id
  role      = "roles/secretmanager.secretAccessor"
  members = [
    "serviceAccount:${google_service_account.main.email}",
  ]
}
#------------------------------------------------------------------------------
