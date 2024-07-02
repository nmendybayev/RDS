# CPU Utilization

variable "alarm_name" {
  type        = string
  description = "The name of alarm"
}
variable "DB_identifier_id" {
  type        = string
  description = "The ID of actual DB to apply alarm and what alarm be track"
}
variable "evaluation_period" {
  type        = string
  description = "The evaluation period over which to use when triggering alarms."
}
variable "statistic_period" {
  type        = string
  description = "The number of seconds that make each statistic period."
}
variable "metric_threshold" {
  type        = string
  description = "Alarm threshold for the 'highCPUUtilization' alarm"
}
variable "db_instance_id" {
  type = string
}
variable "tags" {
  type = map(string)
}

# Creating and subscription to SNS topic

variable "topic_name" {
  type        = string
  description = "The SNS topic actual name"
}
variable "receiving_notification_email" {
  type        = string
  description = "Email for receiving notification"
}