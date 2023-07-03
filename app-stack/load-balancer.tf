#resource "google_compute_address" "loadbalancer" {
#  name         = "my-standard-tier-ip-address"
#  region       = var.region
#  network_tier = "STANDARD"
#}

resource "google_compute_address" "loadbalancer_premium" {
  name         = "my-premium-tier-ip-address"
  region       = var.region
  network_tier = "PREMIUM"
}



resource "google_compute_firewall" "nginx_loadbalancer" {
  #  destination_ranges      = []
  name          = "enable-call-nginx-ingress-webhook"
  network       = google_compute_network.main.name
  source_ranges = [google_container_cluster.main.private_cluster_config[0].master_ipv4_cidr_block]
  target_tags = [local.node_pool_tag]

  allow {
    protocol = "tcp"
    ports    = ["8443"]
  }
}

##terraform import google_compute_forwarding_rule.frontend a17845d1b167d4c58b5b7ce7df5ec568
##resource "google_compute_forwarding_rule" "frontend" {
##  provider                = google-beta
###  depends_on = [google_compute_subnetwork.proxy]
##  name       = "l7-xlb-forwarding-rule-http"
##  region     = google_compute_subnetwork.main.region
##  ip_protocol           = "TCP"
##  load_balancing_scheme = "EXTERNAL_MANAGED"
##  port_range            = "80"
##  target                = google_compute_region_target_http_proxy.default.id
##  network               = google_compute_network.default.id
##  ip_address            = google_compute_address.default.id
##  network_tier          = "STANDARD"
##}

# terraform import google_compute_forwarding_rule.frontend ae5d8d572fd15464fa29236826157652
#resource "google_compute_forwarding_rule" "frontend" {
#  provider              = google-beta
#  description             = jsonencode(
#    {
#      "kubernetes.io/service-name" = "ingress-nginx/ingress-nginx-controller"
#    }
#  )
##  ip_address              = "35.205.173.34"
#  ip_address              = "130.211.97.11"
#  ip_protocol             = "TCP"
#  is_mirroring_collector  = false
#  load_balancing_scheme   = "EXTERNAL"
#  name                    = "ae5d8d572fd15464fa29236826157652"
##  network_tier            = "STANDARD"
#  port_range              = "80-443"
#  region                  = google_compute_subnetwork.main.region
#  target                  = google_compute_target_pool.default.id
#}

# terraform import google_compute_target_pool.default ae5d8d572fd15464fa29236826157652
#resource "google_compute_target_pool" "default" {
#  description      = jsonencode(
#    {
#      "kubernetes.io/service-name" = "ingress-nginx/ingress-nginx-controller"
#    }
#  )
#  failover_ratio   = 0
#  health_checks    = [google_compute_http_health_check.default.id]
#  instances        = [
#    "europe-west1-b/gke-cluster-1-default-pool-8acbb45c-jwgg",
#    "europe-west1-b/gke-cluster-1-default-pool-8acbb45c-vr8k",
#  ]
#  name             = "ae5d8d572fd15464fa29236826157652"
#  project          = "basic-388908"
#  region           = "europe-west1"
#  session_affinity = "NONE"
#}

# terraform import google_compute_http_health_check.default k8s-d0a00214f8d9a16c-node
#resource "google_compute_http_health_check" "default" {
#  name                = "k8s-d0a00214f8d9a16c-node"
#  request_path        = "/healthz"
#  port                = 10256
#
#  description         = jsonencode(
#    {
#      "kubernetes.io/service-name" = "k8s-d0a00214f8d9a16c-node"
#    }
#  )
#
#  check_interval_sec  = 8
#  healthy_threshold   = 1
#  timeout_sec         = 1
#  unhealthy_threshold = 3
#}






resource "null_resource" "install_ingress_controller" {
  depends_on = [null_resource.local_k8s_context]

  provisioner "local-exec" {
#    command = "helm upgrade --install ingress-nginx ingress-nginx --repo https://kubernetes.github.io/ingress-nginx --namespace ingress-nginx --create-namespace"
    command = "kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.8.0/deploy/static/provider/cloud/deploy.yaml"
  }
}
# loadbalancer    a272abf6849f3498da993b70beed9df6 Network (target pool-based) TCP
# forwarding rule a272abf6849f3498da993b70beed9df6 {"kubernetes.io/service-name":"ingress-nginx/ingress-nginx-controller"} EXTERNAL Premium   == Loadbalancer.Frontend
# targetPool      a272abf6849f3498da993b70beed9df6                                                                                            == Loadbalancer.Backend
  # healtcheck k8s-f80329dcc1cd7006-node

resource "null_resource" "uninstall_ingress_controller" {
  provisioner "local-exec" {
    when    = destroy
#    command = "helm uninstall ingress-nginx --namespace ingress-nginx"
    command = "kubectl delete -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.8.0/deploy/static/provider/cloud/deploy.yaml"
  }
}
