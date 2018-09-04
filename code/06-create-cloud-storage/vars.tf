# Name of Google Cloud Storage bucket
variable "bucket_name" {
  description = "The name of the Google Cloud Storage bucket. Must be globally unique."
  default = "terraform-state-afb"
}
