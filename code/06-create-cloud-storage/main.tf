# Configure the Google Cloud provider
provider "google" {
  project = "terraform-examples-gcloud"
  region  = "us-east1"
}

# Create a Google Cloud Storage Bucket
resource "google_storage_bucket" "terraform_state" {
  name          = "${var.bucket_name}"
  force_destroy = true
}
