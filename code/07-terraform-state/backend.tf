# Define Terraform backend using a Google Cloud Storage bucket for storing the Terraform state
terraform {
  backend "gcs" {
    bucket  = "terraform-state-my-bucket"
    path    = "terraform-state/terraform.tfstate"
    project = "terraform-examples-gcloud"
 }
}
