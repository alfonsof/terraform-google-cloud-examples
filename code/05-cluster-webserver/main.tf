# Configure the Google Cloud provider
provider "google" {
  project = "terraform-examples-gcloud"
  region  = "us-east1"
}

# Create a Google Compute Address
resource "google_compute_address" "example" {
    name = "example-address"
}

# Create a Google Compute Firewall
resource "google_compute_firewall" "instance" {
  name    = "terraform-example-instance"
  network = "default"

  source_ranges = ["0.0.0.0/0"]

  allow {
    protocol = "tcp"
    ports    = ["${var.server_port}"]
  }
}

#---------------------------------------------------------------------

# Create a Google Compute Forwarding Rule
resource "google_compute_forwarding_rule" "example" {
  name       = "example-forwarding-rule"
  target     = "${google_compute_target_pool.example.self_link}"
  port_range = "80"
  ip_address = "${google_compute_address.example.address}"
}

resource "google_compute_target_pool" "example" {
  name          = "example-target-pool"
  health_checks = ["${google_compute_http_health_check.example.name}"]
}

# Create a Google Compute Http Health Check
resource "google_compute_http_health_check" "example" {
  name                 = "example-health-check"
  request_path         = "/"
  check_interval_sec   = 30
  timeout_sec          = 3
  healthy_threshold    = 2
  unhealthy_threshold  = 2
  port                 = "${var.server_port}"
}

#---------------------------------------------------------------------

# Create a Google Compute instance Group Manager
resource "google_compute_instance_group_manager" "example" {
  name = "example-group-manager"
  zone = "us-east1-b"

  instance_template  = "${google_compute_instance_template.example.self_link}"
  target_pools       = ["${google_compute_target_pool.example.self_link}"]
  base_instance_name = "example"
}

# Create a Google Compute Autoscaler
resource "google_compute_autoscaler" "example" {
  name   = "example-autoscaler"
  zone   = "us-east1-b"
  target = "${google_compute_instance_group_manager.example.self_link}"

  autoscaling_policy = {
    max_replicas    = 8
    min_replicas    = 2
    cooldown_period = 60

    cpu_utilization {
      target = 0.5
    }
  }
}

# Create a Google Compute instance Template
resource "google_compute_instance_template" "example" {
  machine_type  = "f1-micro"
  
  disk {
    source_image = "ubuntu-1604-lts"
  }
  
  network_interface {
    network = "default"
  }
  
  metadata_startup_script = "echo 'Hello, World' > index.html ; nohup busybox httpd -f -p ${var.server_port} &"
}

#---------------------------------------------------------------------
/*
# Create a Google Compute Backend Service
resource "google_compute_backend_service" "example" {
  name        = "example-backend-service"
  port_name   = "http"
  protocol    = "HTTP"
  timeout_sec = 10
  enable_cdn  = false

  backend {
    group = "${google_compute_instance_group_manager.example.instance_group}"
  }

  health_checks = ["${google_compute_http_health_check.example.self_link}"]
}
*/
#---------------------------------------------------------------------
