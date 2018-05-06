resource "pagerduty_schedule" "dayshift" {
  count = "${var.dayshift ? 1 : 0}"
  name      = "${var.service} Nightly Engineering Rotation"
  time_zone = "${var.nightshift_timezone}"

  layer {
    name                         = "Night Shift"
    start                        = "2015-11-06T20:00:00-05:00"
    rotation_virtual_start       = "2015-11-06T20:00:00-05:00"
    rotation_turn_length_seconds = "${var.nightshift_rotation_length*60*60}"
    users                        = ["${var.dayshift_users}"]

    restriction {
      type              = "daily_restriction"
      start_time_of_day = "${var.nightshift_shift_start}"
      duration_seconds  = "${var.nightshift_shift_length*60*60}"
    }
  }
}
