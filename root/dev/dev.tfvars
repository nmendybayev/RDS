# DB configuration

identifier                             = "dev-mysql-db"
db_engine                              = "mysql"
bd_engine_version                      = "5.7.44"
db_instance_class                      = "db.t3.micro"
db_name                                = "devDB" # only alphanumeric characters
db_allocated_storage                   = 20      #Gi
db_max_allocated_storage               = 40      #Gi
skip_final_snapshot_db                 = true
copy_tags_to_snapshot_db               = false
multi_az_db                            = false
deletion_protection_db                 = false
iam_database_authentication_enabled_db = true
performance_insights                   = false

# Backup configuration section

backup_retention_period         = 7
backup_window                   = "00:00-03:00"
maintenance_window              = "sat:03:01-sat:06:00"
enabled_cloudwatch_logs_exports = ["audit", "general", "error", "slowquery"]

# Secret variables

secret_name = "dev-mysql-credentials"

# Security group variables

sg-name            = "dev-rds-sg"
env                = "dev"
from_port          = "3306"
to_port            = "3306"
cidr_block_engress = ["0.0.0.0/0"]
protol_engress     = "tcp"
from_port_egress   = 0
to_port_egress     = 0
protol_egress      = "-1"
cidr_block_egress  = ["0.0.0.0/0"]

# VPC subnet variables

aws_region = "us-east-1"
subnet_addresses = [
  "10.0.0.64/26",
  "10.0.0.192/26"
]
availability_zone = [
  "a",
  "b"
]
subnet_group      = "dev-mysql"
subnet_group_name = "dev-mysql-subnet-group"

# CPU Utilization

alarm_name        = "mysql-dev-alarm"
DB_identifier_id  = "dev-mysql-db"
evaluation_period = "1"
statistic_period  = "60"
metric_threshold  = "50" # for testing purposes
db_instance_id    = "dev-mysql-db"
tags = {
  Environment = "dev"
  Application = "mysql"
}

# SNS topic creating and subscription

topic_name                   = "rds-alarm"
receiving_notification_email = "nmend.job@gmail.com"