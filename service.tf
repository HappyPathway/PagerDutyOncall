resource "pagerduty_service" "service" {
  name                    = "${var.service}"
  auto_resolve_timeout    = 14400
  acknowledgement_timeout = 600
  escalation_policy       = "${pagerduty_escalation_policy.policy.id}"
  alert_creation          = "create_incidents"
}