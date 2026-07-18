variable "project_id" {
  description = "ID of the project in which to create the alert policy."
  type        = string
}

variable "display_name" {
  description = "Display name of the alert policy."
  type        = string
}

variable "combiner" {
  description = "How to combine the conditions: AND, OR, AND_WITH_MATCHING_RESOURCE."
  type        = string
  default     = "OR"

  validation {
    condition     = contains(["AND", "OR", "AND_WITH_MATCHING_RESOURCE"], var.combiner)
    error_message = "combiner must be one of AND, OR or AND_WITH_MATCHING_RESOURCE."
  }
}

variable "condition_display_name" {
  description = "Display name of the metric threshold condition."
  type        = string
  default     = "metric threshold"
}

variable "filter" {
  description = "Monitoring filter selecting the time series to evaluate."
  type        = string
  default     = "resource.type = \"gce_instance\" AND metric.type = \"compute.googleapis.com/instance/cpu/utilization\""
}

variable "threshold_value" {
  description = "Threshold the aligned metric must cross to trigger the alert."
  type        = number
  default     = 0.8
}

variable "comparison" {
  description = "Comparison operator used against the threshold."
  type        = string
  default     = "COMPARISON_GT"
}

variable "duration" {
  description = "Duration the condition must hold before alerting, e.g. \"60s\"."
  type        = string
  default     = "60s"
}

variable "notification_channels" {
  description = "Notification channel ids alerted when the policy fires."
  type        = list(string)
  default     = []
}
