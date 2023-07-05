# terraform import google_container_cluster.primary projects/basic-388908/locations/europe-west1-b/clusters/cluster-1
resource "google_container_cluster" "main" {
  provider = google-beta
  #  name     = "${var.company_name}-${var.application_code}-${var.environment}-kcl-${var.region_code}"
  name     = "${var.environment}-gke"
  location = local.zone

  # Disable the Google Cloud Logging service because you may overrun the Logging free tier allocation, and it may be expensive
  #  logging_service = "none"

  release_channel {
    # STABLE+europe-west1-b: 1.24.12-gke.500
    # REGULAR+europe-central2-b: 1.25.8-gke.500
    channel = "REGULAR"
  }


  #  remove_default_node_pool = true
  #  initial_node_count       = 2
  initial_node_count = 0

  network    = google_compute_network.main.id
  subnetwork = google_compute_subnetwork.main.id

  addons_config {
    dns_cache_config {
      enabled = false
    }

    horizontal_pod_autoscaling {
      disabled = false
    }

    #    http_load_balancing {
    #      disabled = true
    #    }
  }

  private_cluster_config {
    enable_private_nodes    = true
    enable_private_endpoint = false
    master_ipv4_cidr_block  = "172.16.0.32/28" # master_ipv4_cidr_block must be set if enable_private_nodes is true
  }

  ip_allocation_policy {}

  workload_identity_config {
    workload_pool = "${var.project_id}.svc.id.goog"
  }

  master_authorized_networks_config {
    dynamic "cidr_blocks" {
      for_each = var.allowing_admin_access_from_ip == null ? [] : [1]
      content {
        cidr_block = var.allowing_admin_access_from_ip
      }
    }
  }

  node_pool {
    name = "default-pool"
    node_locations = [
      local.zone,
    ]
    node_count = 2

    node_config {
      disk_size_gb = 10
      disk_type    = "pd-standard"
      spot         = true
      tags         = [local.node_pool_tag]
      labels       = {}

      #      machine_type = "e2-micro" nginx-ing-nginx-ingress-controller: 0/2 nodes are available: 2 Insufficient memory. preemption: 0/2 nodes are available: 2 No preemption victims found for incoming pod.
      machine_type = "e2-small"
      #      machine_type = "e2-medium"
      metadata = {
        "disable-legacy-endpoints" = "true"
      }

      workload_metadata_config {
        mode = "GKE_METADATA"
      }

      oauth_scopes = [
        "https://www.googleapis.com/auth/devstorage.read_only",
        "https://www.googleapis.com/auth/logging.write",
        "https://www.googleapis.com/auth/monitoring",
        "https://www.googleapis.com/auth/service.management.readonly",
        "https://www.googleapis.com/auth/servicecontrol",
        "https://www.googleapis.com/auth/trace.append",
        # "https://www.googleapis.com/auth/cloud-platform",
      ]
    }
  }
}

resource "null_resource" "local_k8s_context" {
  depends_on = [google_container_cluster.main]

  provisioner "local-exec" {
    command = "for i in 1 2 3 4 5; do gcloud container clusters get-credentials ${google_container_cluster.main.name} --project=${var.project_id} --zone=${google_container_cluster.main.location} && break || sleep 60; done"
  }
}
