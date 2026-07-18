# terraform-google-monitoring

Terraform module that manages a [Google Cloud](https://cloud.google.com/)
Cloud Monitoring alert policy (`google_monitoring_alert_policy`). It creates a
single metric-threshold condition with configurable filter, comparison and
duration.

## Usage

```hcl
module "monitoring" {
  source = "github.com/cybercapybara/terraform-google-monitoring"

  project_id      = var.project_id
  display_name    = "High CPU utilization"
  filter          = "resource.type = \"gce_instance\" AND metric.type = \"compute.googleapis.com/instance/cpu/utilization\""
  threshold_value = 0.8
  duration        = "120s"

  notification_channels = [google_monitoring_notification_channel.email.id]
}
```

A runnable example lives in [`examples/basic`](examples/basic).

## Requirements

| Name      | Version  |
|-----------|----------|
| terraform | >= 1.5   |
| google    | >= 5.0   |

## Inputs

| Name                     | Description                                              | Type           | Default            | Required |
|--------------------------|----------------------------------------------------------|----------------|--------------------|:--------:|
| `project_id`             | ID of the project in which to create the policy.         | `string`       | n/a                |   yes    |
| `display_name`           | Display name of the alert policy.                        | `string`       | n/a                |   yes    |
| `combiner`               | How to combine the conditions.                           | `string`       | `"OR"`             |    no    |
| `condition_display_name` | Display name of the condition.                           | `string`       | `"metric threshold"`|   no    |
| `filter`                 | Monitoring filter selecting the time series.             | `string`       | CPU utilization    |    no    |
| `threshold_value`        | Threshold the aligned metric must cross.                 | `number`       | `0.8`              |    no    |
| `comparison`             | Comparison operator used against the threshold.          | `string`       | `"COMPARISON_GT"`  |    no    |
| `duration`               | Duration the condition must hold before alerting.        | `string`       | `"60s"`            |    no    |
| `notification_channels`  | Notification channel ids alerted when firing.            | `list(string)` | `[]`               |    no    |

## Outputs

| Name   | Description                        |
|--------|------------------------------------|
| `id`   | Identifier of the alert policy.   |
| `name` | Resource name of the alert policy.|

## License

[MIT](LICENSE)
