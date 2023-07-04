locals {
  variable_mapping = {
    DATABASE_HOST = var.cloud_sql_database_private_ip,
    DATABASE_NAME = google_sql_database.app.name,
    DATABASE_USER = google_sql_user.app.name,
    DATABASE_PASSWORD = google_sql_user.app.password,
  }
}
