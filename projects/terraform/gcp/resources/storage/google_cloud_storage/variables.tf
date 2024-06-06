variable "project_id" {
    description = "The GCP Project ID"
    type = string
}

variable "bucket_name" {
    description = "the name of the stoage bucket"
    type = string
}

variable "location" {
    description = "the location of the storage bucket"
    type = string
    default = "US"
}

