variable "project_id" {
  description = "The project ID for GCP"
  type        = string
}

variable "custom_prefix" {
  description = "Prefix for naming resources"
  type        = string
}

variable "cloud_functions" {
  description = "List of cloud functions to create"
  type = list(object({
    function_name     = string
    function_location = string
    description       = string
    build_config = object({
      runtime     = string
      entry_point = string
      build_service_account = optional(string) 
      build_env_variables = map(string)
      source = object({
        storage_source = object({
          bucket = string
          object = string
        })
      })
    })
    service_config = object({
      max_instance_count               = number
      min_instance_count               = number
      available_memory                 = string
      timeout_seconds                  = number
      max_instance_request_concurrency = number
      available_cpu                    = string
      service_env_variables            = map(string)
      ingress_settings                 = string
      all_traffic_on_latest_revision   = string
      vpc_connector                    = string
      service_account_email            = string
    })
  }))
}

variable "cloud_schedulers" {
  description = "List of cloud schedulers to create"
  type = list(object({
    scheduler_name        = string
    scheduler_description = string
    cron_schedule         = string
    time_zone             = string
    retry_config = object({
      min_backoff_duration = string
      max_retry_duration   = string
      max_doublings        = number
      retry_count          = number
    })
    http_target = object({
      http_method = string
      oidc_token = object({
        service_account_email = string
      })
    })
  }))
}
