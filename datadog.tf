data "pagerduty_vendor" "datadog" {
  name = "Datadog"
}

resource "pagerduty_service_integration" "datadog" {
  name    = "${data.pagerduty_vendor.datadog.name}"
  service = "${"pagerduty_service.service.id}"
  vendor  = "${data.pagerduty_vendor.datadog.id}"
}
