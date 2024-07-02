# DB configuration

variable "identifier" {}
variable "db_engine" {}
variable "bd_engine_version" {}
variable "db_instance_class" {}
variable "db_name" {}
variable "db_allocated_storage" {}
variable "db_max_allocated_storage" {}
variable "skip_final_snapshot_db" {}
variable "copy_tags_to_snapshot_db" {}
variable "multi_az_db" {}
variable "deletion_protection_db" {}
variable "iam_database_authentication_enabled_db" {}
variable "performance_insights" {}

# Backup configuration section

variable "backup_retention_period" {}
variable "backup_window" {}
variable "maintenance_window" {}
variable "enabled_cloudwatch_logs_exports" {}
variable "secret_name" {}


# Security group variables

variable "sg-name" {}
variable "env" {}
variable "from_port" {}
variable "to_port" {}
variable "cidr_block_engress" {}
variable "protol_engress" {}
variable "from_port_egress" {}
variable "to_port_egress" {}
variable "protol_egress" {}
variable "cidr_block_egress" {}

# VPC subnet variables

variable "aws_region" {}
variable "subnet_addresses" {}
variable "availability_zone" {}
variable "subnet_group" {}
variable "subnet_group_name" {}

# IAM DB authentication

variable "iam_role_name" {}
variable "iam_policy_name" {}

# CPU Utilization

variable "alarm_name" {}
variable "DB_identifier_id" {}
variable "evaluation_period" {}
variable "statistic_period" {}
variable "metric_threshold" {}
variable "db_instance_id" {}
variable "tags" {}

# SNS topic creating and subscription

variable "topic_name" {}
variable "receiving_notification_email" {}