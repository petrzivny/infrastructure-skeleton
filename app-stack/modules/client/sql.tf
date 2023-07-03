resource "google_sql_user" "app" {
  instance = var.cloud_sql_database_id
  name     = var.database_user
  password = var.database_password
}

resource "google_sql_database" "app" {
  instance = var.cloud_sql_database_id
  name     = "${var.app_name}-${var.app_environment}"
}
