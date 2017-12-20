terraform {
  backend "gcs" {
    bucket  = "terraform-state-afb"
    path    = "terraform-state/terraform.tfstate"
    project = "terraform-examples-gcloud"
 }
}
