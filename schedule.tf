resource "pagerduty_schedule" "schedule" {
  name      = "${var.service} Daily Engineering Rotation"
  time_zone = "America/New_York"

  layer {
    name                         = "Day Shift"
    start                        = "2015-11-06T20:00:00-05:00"
    rotation_virtual_start       = "2015-11-06T20:00:00-05:00"
    rotation_turn_length_seconds = 86400
    users                        = "${var.dayshift_users}"

    restriction {
      type              = "daily_restriction"
      start_time_of_day = "08:00:00"
      duration_seconds  = 43200
    }
  }

  layer {
    name                         = "Day Shift"
    start                        = "2015-11-06T20:00:00-05:00"
    rotation_virtual_start       = "2015-11-06T20:00:00-05:00"
    rotation_turn_length_seconds = 86400
    users                        = "${var.nightshift_users}"

    restriction {
      type              = "daily_restriction"
      start_time_of_day = "20:00:00"
      duration_seconds  = 43200
    }
  }
}