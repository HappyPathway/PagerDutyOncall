resource "pagerduty_escalation_policy" "policy" {
  name      = "${var.service} Escalation Policy"
  num_loops = 2
  teams     = [
      "${pagerduty_team.nightteam.id}",
      "${pagerduty_team.dayteam.id}"
      ]

  rule {
    escalation_delay_in_minutes = 10

    target {
      type = "schedule"
      id   = "${pagerduty_schedule.nightshift.id}"
    }
  }
}