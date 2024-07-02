output "mysql-sg-id" {
  value = aws_security_group.rds_sg.id
}

output "sb-gr-md" {
  value = aws_db_subnet_group.mysql_db_subnet.id
}

# Query your VPC id and pass to output. Variable 'env' created during deploying vpc

data "aws_vpc" "your_vpc" {
  tags = {
    Name = "${var.env}-main"
  }
}

output "vpc_id" {
  value = data.aws_vpc.your_vpc.id
}