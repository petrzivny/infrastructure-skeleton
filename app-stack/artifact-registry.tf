# terraform import google_artifact_registry_repository.main projects/basic-388908/locations/europe-west1/repositories/totea-symfony-react-skeleton-ar
resource "google_artifact_registry_repository" "main" {
  repository_id = "${var.environment}-registry-${var.region}"
  location      = google_compute_subnetwork.main.region
  format        = "DOCKER"
}
