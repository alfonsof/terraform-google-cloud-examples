variable "server_port" {
  description = "The port the server will use for HTTP requests"
  default = "8080"
}

provider "google" {
  project     = "terraform-examples-gcloud"
  # credentials = GOOGLE_CREDENTIALS
  region = "us-east1"
}

resource "google_compute_firewall" "instance" {
  name    = "terraform-example-instance"
  network = "default"

  source_ranges = ["0.0.0.0/0"]

  allow {
    protocol = "tcp"
    ports    = ["8080"]
  }
}

resource "google_compute_instance" "example" {
  name          = "example"
  machine_type  = "f1-micro"
  zone          = "us-east1-b"
  
  boot_disk {
    initialize_params {
      image = "ubuntu-1604-lts"
    }
  }
  
  network_interface {
    network = "default"

    access_config {
      // Ephemeral IP
    }
  }
  
  tags = ["terraform-example"]
  
  metadata_startup_script = "echo 'Hello, World' > index.html ; nohup busybox httpd -f -p ${var.server_port} &"
}

output "public_ip" {
  value = "${google_compute_instance.example.network_interface.0.access_config.0.assigned_nat_ip}"
}
