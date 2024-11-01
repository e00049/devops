resource "google_cloudfunctions2_function" "cloud_functions" {
  count = length(var.cloud_functions)

  name        = "gfr-cd-${var.custom_prefix}-${var.cloud_functions[count.index].function_name}"
  project     =  var.project_id
  location    = var.cloud_functions[count.index].function_location
  description = var.cloud_functions[count.index].description

  build_config {
    runtime     = var.cloud_functions[count.index].build_config.runtime 
    entry_point = var.cloud_functions[count.index].build_config.entry_point
    service_account       = var.cloud_functions[count.index].build_config.build_service_account != null ? "projects/${var.project_id}/serviceAccounts/${var.cloud_functions[count.index].build_config.build_service_account}" : null    
    environment_variables = var.cloud_functions[count.index].build_config.build_env_variables

    source {
      storage_source {
        bucket = var.cloud_functions[count.index].build_config.source.storage_source.bucket
        object = var.cloud_functions[count.index].build_config.source.storage_source.object
      }
    }
  }

  service_config {
    max_instance_count               = var.cloud_functions[count.index].service_config.max_instance_count
    min_instance_count               = var.cloud_functions[count.index].service_config.min_instance_count
    available_memory                 = var.cloud_functions[count.index].service_config.available_memory
    timeout_seconds                  = var.cloud_functions[count.index].service_config.timeout_seconds
    max_instance_request_concurrency = var.cloud_functions[count.index].service_config.max_instance_request_concurrency
    available_cpu                    = var.cloud_functions[count.index].service_config.available_cpu
    environment_variables            = var.cloud_functions[count.index].service_config.service_env_variables
    ingress_settings                 = var.cloud_functions[count.index].service_config.ingress_settings
    all_traffic_on_latest_revision   = var.cloud_functions[count.index].service_config.all_traffic_on_latest_revision
    vpc_connector                    = "projects/${var.project_id}/locations/${var.cloud_functions[count.index].function_location}/connectors/${var.cloud_functions[count.index].service_config.vpc_connector}"
    service_account_email            = var.cloud_functions[count.index].service_config.service_account_email
  }

  event_trigger {
  }
  lifecycle {
    ignore_changes = [
      event_trigger    
      ]
  }
}

resource "google_cloud_scheduler_job" "cloud_schedulers" {
  count = length(var.cloud_schedulers)

  name        = "gfr-cd-${var.custom_prefix}-${var.cloud_schedulers[count.index].scheduler_name}"
  description = var.cloud_schedulers[count.index].scheduler_description
  schedule    = var.cloud_schedulers[count.index].cron_schedule
  project     = var.project_id
  region      = var.cloud_functions[count.index].function_location
  time_zone   = var.cloud_schedulers[count.index].time_zone 

  http_target {
    uri         = google_cloudfunctions2_function.cloud_functions[count.index].service_config[0].uri    
    http_method = var.cloud_schedulers[count.index].http_target.http_method

    oidc_token {
      audience              = "${google_cloudfunctions2_function.cloud_functions[count.index].service_config[0].uri}/"
      service_account_email = var.cloud_schedulers[count.index].http_target.oidc_token.service_account_email
    }
  }

  depends_on = [ 
    google_cloudfunctions2_function.cloud_functions 
  ] 
}
