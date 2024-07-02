# DB configuration

identifier                             = "prod-mysql-db"
db_engine                              = "mysql"
bd_engine_version                      = "5.7.44"
db_instance_class                      = "db.m6gd.8xlarge"
db_name                                = "prodDB"
db_allocated_storage                   = 400 #Gi
db_max_allocated_storage               = 800 #Gi
skip_final_snapshot_db                 = true
copy_tags_to_snapshot_db               = true
multi_az_db                            = true
deletion_protection_db                 = true
iam_database_authentication_enabled_db = true
performance_insights                   = true

# Backup configuration section

backup_retention_period         = 3
backup_window                   = "00:00-03:00"
maintenance_window              = "sat:03:01-sat:06:00"
enabled_cloudwatch_logs_exports = ["audit", "general", "error", "slowquery"]

# Secret variables

secret_name = "prod-mysql-creds"

# Security group variables

sg-name            = "prod-rds-sg"
env                = "prod"
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
  "172.31.144.0/20",
  "172.31.160.0/20"
]

availability_zone = [
  "a",
  "b"
]
subnet_group      = "prod-mysql"
subnet_group_name = "prod-mysql-subnet-group"

# CPU Utilization

alarm_name        = "mysql-prod-alarm"
DB_identifier_id  = "prod-mysql-db"
evaluation_period = "1"
statistic_period  = "60"
metric_threshold  = "80"
db_instance_id    = "prod-mysql-db"
tags = {
  Environment = "prod"
  Application = "mysql"
}

# SNS topic creating and subscription

topic_name                   = "rds-alarm"
receiving_notification_email = "nmend.job@gmail.com"