provider "google" {
  credentials = file("/opt/actions-runner/sec.json")
  project     = var.project_id
  region      = var.region
}

resource "google_storage_bucket" "example" {
  name     = "${var.project_id}-tf-bucket"
  location = var.region
  force_destroy = true
}

variable "project_id" {
  type = string
}

variable "region" {
  type    = string
  default = "us-central1"
}

output "bucket_url" {
  value = "gs://${google_storage_bucket.example.name}"
}
