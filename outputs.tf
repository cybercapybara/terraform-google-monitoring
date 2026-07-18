output "id" {
  description = "Identifier of the alert policy."
  value       = google_monitoring_alert_policy.this.id
}

output "name" {
  description = "Resource name of the alert policy."
  value       = google_monitoring_alert_policy.this.name
}
