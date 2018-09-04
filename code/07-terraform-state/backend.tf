# Stores the state as a given key in a given Google Cloud Storage bucket
terraform {
  backend "gcs" {
    bucket  = "terraform-state-afb"
    path    = "terraform-state/terraform.tfstate"
    project = "terraform-examples-gcloud"
 }
}
