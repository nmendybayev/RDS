#DB configuration

variable "rds_sg_id" {
  type = string
}
variable "db_subnet_group_name" {
  type = string
}
variable "identifier" {
  type = string
}
variable "db_engine" {
  type = string
}
variable "bd_engine_version" {
  type = string
}
variable "db_instance_class" {
  type = string
}
variable "db_name" {
  type = string
}
variable "db_allocated_storage" {
  type = number #Gi
}
variable "db_max_allocated_storage" {
  type = number #Gi
}
variable "skip_final_snapshot_db" {
  type = bool
}
variable "copy_tags_to_snapshot_db" {
  type = bool
}
variable "multi_az_db" {
  type = bool
}
variable "deletion_protection_db" {
  type = bool
}
variable "iam_database_authentication_enabled_db" {
  type = bool
}
variable "performance_insights" {
  type = bool
}

# Backup configuration section

variable "backup_retention_period" {
  type = number
}
variable "backup_window" {
  type = string
}
variable "maintenance_window" {
  type = string
}

# CloudWatch

variable "enabled_cloudwatch_logs_exports" {
  type = list(string)
}

# Secrets

variable "secret_name" {
  type = string
}