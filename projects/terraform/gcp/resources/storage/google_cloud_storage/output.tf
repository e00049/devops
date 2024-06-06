output "bucker_name" {
  description = "the name of the storage bucker"
  value = google_storage_bucket.bucket1.name
}

output "bucket-self_link" {
    description = "the self link of the sorage bucket"
    value = google_storage_bucket.bucket1.self_link
}

output "bucket_url" {
    description = "the URL of the sorage bucket"
    value = google_storage_bucket.bucket1.url
}
