resource "pagerduty_schedule" "nightshift" {
  count = "${var.dayshift ? 1 : 0}"
  name      = "${var.service} Nightly Engineering Rotation"
  time_zone = "${var.dayshift_timezone}"

  layer {
    name                         = "Day Shift"
    start                        = "2015-11-06T20:00:00-05:00"
    rotation_virtual_start       = "2015-11-06T20:00:00-05:00"
    rotation_turn_length_seconds = "${var.dayshift_rotation_length*60*60}"
    users                        = "${list(var.dayshift_users)}"

    restriction {
      type              = "daily_restriction"
      start_time_of_day = "${var.dayshift_shift_start}"
      duration_seconds  = "${var.dayshift_shift_length*60*60}"
    }
  }
}