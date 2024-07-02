# Create RDS DB Instance                                                                                    
resource "aws_db_instance" "mysql" {

  identifier = var.identifier # give a name to your DB

  allocated_storage     = var.db_allocated_storage     # Base amount of starage space in Gi
  max_allocated_storage = var.db_max_allocated_storage # Enable and Configure RDS Storage AutoScaling
  engine                = var.db_engine
  engine_version        = var.bd_engine_version
  instance_class        = var.db_instance_class
  db_name               = var.db_name

  # Credentials. See 'secrets.tf'

  username = local.db_creds.username # data encrypted by aws kms service 
  password = local.db_creds.password # data encrypted by aws kms service

  # DB configurations  

  skip_final_snapshot                 = var.skip_final_snapshot_db #"false" in prod
  copy_tags_to_snapshot               = var.copy_tags_to_snapshot_db
  multi_az                            = var.multi_az_db            # Set up multi_az db config
  deletion_protection                 = var.deletion_protection_db #"true" in prod
  iam_database_authentication_enabled = var.iam_database_authentication_enabled_db

  # Networking

  db_subnet_group_name   = var.db_subnet_group_name
  vpc_security_group_ids = [var.rds_sg_id]

  # Backup configuration section. Enable backups  

  backup_retention_period         = var.backup_retention_period         # Optional: set a backup_periods in days .
  backup_window                   = var.backup_window                   # Optional: set a backup_window in UTC time.
  maintenance_window              = var.maintenance_window              # Optional: set a backup_window in UTC time.
  enabled_cloudwatch_logs_exports = var.enabled_cloudwatch_logs_exports # set all types of logs for CloudWatch using
}