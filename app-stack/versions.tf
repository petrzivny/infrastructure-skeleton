provider "google" {
  #  credentials = file(var.credentials_file)
  project = var.gcp_project_id
  #  zone      = var.network_region
  zone = var.zone
}

provider "google-beta" {
  project = var.gcp_project_id
  zone    = var.zone
}
