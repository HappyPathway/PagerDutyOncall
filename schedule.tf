data "pagerduty_user" "nightshift_users" {
    count = "${length(var.nightshift_users)}"
    email = "${element(var.nightshift_users, count.index)}"
}

data "pagerduty_user" "dayshift_users" {
    count = "${length(var.dayshift_users)}"
    email = "${element(var.dayshift_users, count.index)}"
}

resource "pagerduty_schedule" "schedule" {
  name      = "${var.service} Daily Engineering Rotation"
  time_zone = "America/New_York"

  layer {
    name                         = "Day Shift"
    start                        = "2015-11-06T20:00:00-05:00"
    rotation_virtual_start       = "2015-11-06T20:00:00-05:00"
    rotation_turn_length_seconds = 86400
    users                        = ["${data.pagerduty_user.dayshift_users.*.id}"]

    restriction {
      type              = "daily_restriction"
      start_time_of_day = "08:00:00"
      duration_seconds  = 43200
    }
  }

  layer {
    name                         = "Night Shift"
    start                        = "2015-11-06T20:00:00-05:00"
    rotation_virtual_start       = "2015-11-06T20:00:00-05:00"
    rotation_turn_length_seconds = 86400
    users                        = ["${data.pagerduty_user.nightshift_users.*.id}"]

    restriction {
      type              = "daily_restriction"
      start_time_of_day = "20:00:00"
      duration_seconds  = 43200
    }
  }
}