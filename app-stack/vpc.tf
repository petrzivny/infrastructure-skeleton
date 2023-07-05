#resource "google_compute_project_default_network_tier" "main" {
#  network_tier = "STANDARD"
#}

resource "google_compute_network" "main" {
  #  name                    = "${var.company_name}-${var.application_code}-${var.dev_environment}-cne"
  name                    = "${var.environment}-net"
  auto_create_subnetworks = "false"
  description             = "Main network for all environments"
}

resource "google_compute_subnetwork" "main" {
  #  name        = "${var.company_name}-${var.application_code}-${var.dev_environment}-csn-${var.region_code}"
  #    name        = "${google_container_cluster.main.name}-subnet"
  name                     = "${var.environment}-subnet-${var.region}"
  region                   = var.region
  network                  = google_compute_network.main.id
  description              = "Subnetwork for all environments"
  ip_cidr_range            = "10.2.204.0/22"
  private_ip_google_access = true
}
