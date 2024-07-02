# RDS MySQL Database Repository

## This repository contains configurations for a RDS MySQL database, created according to Terraform best practices for both 'prod' and 'dev' environments. The DB is integrated with CloudWatch alarms to trigger alerts when CPU usage exceeds 80%.

### Configurations:

1. The database utilizes an existing VPC and creates its own security group and private subnets.
2. AWS Secret Manager is used for storing and managing secrets securely.
3. The project leverages modules and `.tfvars` files for configuring both 'prod' and 'dev' environments.
4. Inbound traffic to the database is configured on port 3306.
5. Configuration includes automation for generating random database passwords.
6. For state management, the configuration uses a remote S3 backend and locks the Terraform state in DynamoDB, but only for the 'prod' configuration.
7. It's recommended to add 'secrets.tf' to the .gitignore file to protect sensitive information. This file is intended here solely for demonstration purposes.
8. The setup uses a CloudWatch Alarm to trigger an alert when CPU usage exceeds 80% in the production environment.

### The project has following structure:

```sh
.
├── README.md
├── alarm             # CloudWatch Alarm module         
│   ├── alarm.tf
│   └── variables.tf
├── mysql             # RDS module
│   ├── mysql.tf
│   ├── secrets.tf
│   └── variables.tf
├── mysql-networking. # Networking module
│   ├── mysql-net.tf
│   ├── outputs.tf
│   └── variable.tf
└── root               # Root module
    ├── dev            # 'dev' environment
    │   ├── dev.tfvars
    │   ├── main.tf
    │   ├── providers.tf
    │   ├── terraform.tfstate
    │   ├── terraform.tfstate.backup
    │   └── variables.tf
    └── prod           # 'prod' environment
        ├── main.tf
        ├── prod.tfvars
        ├── providers.tf
        └── variables.tf
```

DEV ACCOUT CONFIGURATIONS:                     | PROD ACCOUT CONFIGURATIONS:

Backup config section, enable backups. = OFF   |     ON
Performance Insights enabled           = OFF   |     OFF
Multi-AZ.                              = OFF   |     ON
Deletion protection                    = OFF   |     ON
Final_snapshot                         = OFF   |     ON
Copy tags to snapshot                  = OFF   |     ON
Storage. Encryption.                   = OFF   |     ON
IAM DB authentication                  = OFF   |     ON
CloudWatch Logs                        = OFF   |     ON
Storage autoscaling                    = ON    |     ON
Create random passwd for db            = ON    |     ON


### Informational Section

**Terraform Best Practices:**
- [Terraform Best Practices](https://medium.com/devops-mojo/terraform-best-practices-top-best-practices-for-terraform-configuration-style-formatting-structure-66b8d938f00c)

**AWS RDS MySQL Best Practices:**
- [AWS RDS MySQL Best Practices](https://www.trendmicro.com/cloudoneconformity/knowledge-base/aws/RDS/)

**Managing Secrets in Terraform:**
- [Creating Secrets in AWS Secrets Manager using Terraform](https://automateinfra.com/2021/03/24/how-to-create-secrets-in-aws-secrets-manager-using-terraform-in-amazon-account/)
- [Managing Terraform Secrets](https://spacelift.io/blog/terraform-secrets)

These resources should provide comprehensive insights into Terraform best practices, optimizing AWS RDS MySQL deployments, and securely managing secrets in your Terraform configurations using AWS Secrets Manager.