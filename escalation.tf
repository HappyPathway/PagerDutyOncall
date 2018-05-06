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

    target {
      type = "schedule"
      id = "${pagerduty_schedule.dayshift.id}"
    }
  }
}

resource "pagerduty_team" "nightteam" {
  name        = "${var.service}-night"
  description = "${var.service} Night Team"
}

resource "pagerduty_team" "dayteam" {
  name        = "${var.service}-day"
  description = "${var.service} Day Team"
}