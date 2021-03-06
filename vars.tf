variable "nightshift" {
    default = true
}

variable "dayshift" {
    default = true
}
variable "service" {}

variable "nightshift_shift_length" {
    default = 12
}

variable "dayshift_shift_length" {
    default = 12
}

variable "dayshift_users" {
    type = "list"
}

variable "nightshift_users" {
    type = "list"
}

variable "nightshift_shift_start" {
    default = "22:00:00"
}

variable "dayshift_shift_start" {
    default = "08:00:00"
}

variable "nightshift_rotation_length" {
    default = "168"
}

variable "dayshift_rotation_length" {
    default = "168"
}

variable "dayshift_timezone" {
    default = "America/New_York"
}

variable "nightshift_timezone" {
    default = "America/New_York"
}

variable "pagerduty_token" {}

variable "support_hours_start" {
    default = "09:00:00"
}

variable "support_hours_end" {
    default = "17:00:00"
}

variable "support_days" {
    type = "list"
    default = [1, 2, 3, 4, 5]
}

variable "auto_resolve_timeout" {
    default = 3600
}

variable "acknowledgement_timeout" {
    default = 3600
}

variable "timezone" {
   default = "America/New_York"
}
