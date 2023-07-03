resource "google_sql_database_instance" "postgres" {
  name             = "postgres-1"
  database_version = "POSTGRES_15"
  region           = google_compute_subnetwork.main.region
  deletion_protection = false  # remove after debug

  settings {
    disk_size = 10
    tier      = "db-f1-micro"

    ip_configuration {
      ipv4_enabled                                  = true # change to false after debug
      private_network                               = google_compute_network.main.id
      enable_private_path_for_google_cloud_services = false
      authorized_networks { # remove after debug
        name  = "Holesovice"
        value = var.allowing_admin_access_from_ip
      }
    }

    backup_configuration {
      binary_log_enabled = false
      enabled            = true
      location           = "eu"
      start_time         = "01:00"
    }
  }
}


