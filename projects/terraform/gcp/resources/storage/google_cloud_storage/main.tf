resource "google_storage_bucket" "bucket1" {
    name = var.bucket_name
    location = var.location
}

