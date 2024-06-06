terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "5.30.0"
    }
  }
}

provider "google" {
  credentials = file("/tmp/e00049-project-workspace.json")    
  project     = "e00049-project-workspace"
  region      = "us-east1"
}

module "gcs_bucket" {
    source = "./google_cloud_storage"
    project_id =  "e00049-project-workspace"
    bucket_name = "e00049"
    location = "US"
}
