resource "pagerduty_escalation_policy" "policy" {
  name      = "${var.service} Escalation Policy"
  num_loops = 2
  teams     = [
      "${pagerduty_team.team.id}"
      ]

  rule {
    escalation_delay_in_minutes = 10

    target {
      type = "schedule"
      id   = "${pagerduty_schedule.schedule.id}"
    }


  }
}

resource "pagerduty_team" "team" {
  name        = "${var.service} Engineering"
  description = "All ${var.service} engineering"
}