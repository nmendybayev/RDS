# Create Security Group for RDS

resource "aws_security_group" "rds_sg" {
  name        = var.sg-name
  description = "SG for RDS"
  vpc_id      = data.aws_vpc.your_vpc.id

  ingress {
    description = "Allow TCP from MySQL inbound traffic"
    from_port   = var.from_port
    to_port     = var.to_port
    protocol    = var.protol_engress
    cidr_blocks = var.cidr_block_engress
  }
  egress {
    description = "Allow outbound traffic from MySQL"
    from_port   = var.from_port_egress
    to_port     = var.to_port_egress
    protocol    = var.protol_egress
    cidr_blocks = var.cidr_block_egress
  }
}

# Find the current AWS region to use for availability zone

data "aws_region" "current" {}

# Create subnet resource

resource "aws_subnet" "db_private_subnet" {
  count             = length(var.subnet_addresses)
  vpc_id            = data.aws_vpc.your_vpc.id
  cidr_block        = element(var.subnet_addresses, count.index)
  availability_zone = "${data.aws_region.current.name}${element(var.availability_zone, count.index)}"

  tags = {
    Name = "${var.subnet_group}subnet-${count.index}"
  }
}

# Allocate RDS DB into the created previously subnets

resource "aws_db_subnet_group" "mysql_db_subnet" {
  name        = var.subnet_group_name
  description = "Subnet group for RDS MySQL instance"
  subnet_ids  = aws_subnet.db_private_subnet.*.id
}