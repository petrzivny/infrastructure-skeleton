resource "google_compute_global_address" "ip_range" {
  address      = "10.120.80.0"
  address_type = "INTERNAL"
  name         = "${var.environment}-ip-range-for-google-services"
  #  change from premium to standard tier
  network       = google_compute_network.main.id
  prefix_length = 24
  purpose       = "VPC_PEERING"
}

resource "google_service_networking_connection" "default" {
  network                 = google_compute_network.main.id
  reserved_peering_ranges = [google_compute_global_address.ip_range.name]
  service                 = "servicenetworking.googleapis.com"
}
