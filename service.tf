resource "pagerduty_service" "service" {
  name                    = "${var.service}"
  description             = "${var.service}"
  auto_resolve_timeout    = "${var.auto_resolve_timeout}"
  acknowledgement_timeout = "${var.acknowledgement_timeout}"
  escalation_policy       = "${pagerduty_escalation_policy.policy.id}"

  incident_urgency_rule {
    type = "use_support_hours"

    during_support_hours {
      type    = "constant"
      urgency = "high"
    }

    outside_support_hours {
      type    = "constant"
      urgency = "low"
    }
  }

  support_hours {
    type         = "fixed_time_per_day"
    time_zone    = "${var.timezone}"
    start_time   = "${var.support_hours_start}"
    end_time     = "${var.support_hours_end}"
    days_of_week = "${var.support_days}"
  }

  scheduled_actions {
    type       = "urgency_change"
    to_urgency = "high"

    at {
      type = "named_time"
      name = "support_hours_start"
    }
  }
}
