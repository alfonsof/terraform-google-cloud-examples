provider "google" {
  project     = "terraform-examples-gcloud"
  # credentials = GOOGLE_CREDENTIALS
  region = "us-east1"
}

resource "google_storage_bucket" "terraform_state" {
  name          = "${var.bucket_name}"
  force_destroy = true
}
