
# CPU Utilization
resource "aws_cloudwatch_metric_alarm" "mysql-alarm" {
  alarm_name          = var.alarm_name
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = var.evaluation_period #parameter specifies the number of consecutive periods over which the specified statistic must meet the threshold to trigger the alarm
  metric_name         = "CPUUtilization"
  namespace           = "AWS/RDS"
  period              = var.statistic_period #parameter specifies the length of time (in seconds) over which each individual metric data point is aggregated and evaluated  
  statistic           = "Average"            #parameter specifies the statistical function that CloudWatch applies to the metric data collected over each evaluation period. 
  threshold           = var.metric_threshold
  alarm_description   = "This metric monitors db cpu utilization"
  alarm_actions       = ["${aws_sns_topic.topic.arn}"]
  ok_actions          = ["${aws_sns_topic.topic.arn}"]
  dimensions = {
    DBInstanceIdentifier = var.DB_identifier_id #identifier of the RDS instance
  }
  tags = var.tags
}

# SNS topic creating and subscription

resource "aws_sns_topic" "topic" {
  name = var.topic_name
  tags = var.tags
}

resource "aws_sns_topic_subscription" "email-target" {
  topic_arn = aws_sns_topic.topic.arn
  protocol  = "email"
  endpoint  = var.receiving_notification_email
}

# https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/aws-services-cloudwatch-metrics.html
# https://docs.aws.amazon.com/en_us/AmazonRDS/latest/UserGuide/rds-metrics.html