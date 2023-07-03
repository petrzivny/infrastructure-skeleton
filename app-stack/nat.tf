resource "google_compute_router" "temp" {
  name    = "temp-nat-router"
  network = google_compute_network.main.id
  region  = google_compute_subnetwork.main.region
}

resource "google_compute_router_nat" "temp" {
  name                               = "temp-nat-router-nat"
  router                             = google_compute_router.temp.name
  region                             = google_compute_router.temp.region
  nat_ip_allocate_option             = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"
}
