terraform {
  required_version = ">= 1.5"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 5.0"
    }
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
}

module "monitoring" {
  source = "../.."

  project_id      = var.project_id
  display_name    = "High CPU utilization"
  threshold_value = 0.8
  duration        = "120s"
}

variable "project_id" {
  description = "Project ID to create the example alert policy in."
  type        = string
}

variable "region" {
  description = "Region for the google provider."
  type        = string
  default     = "us-central1"
}

output "alert_policy_name" {
  value = module.monitoring.name
}
