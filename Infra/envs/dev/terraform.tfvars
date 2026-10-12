# ======================== VPC ========================== #
name   = "boa-dev"
region = "ap-south-1"

vpc_cidr         = "10.0.0.0/16"
public_subnets   = ["10.0.0.0/24", "10.0.1.0/24"]
private_subnets  = ["10.0.16.0/20", "10.0.32.0/20"]
database_subnets = ["10.0.200.0/24", "10.0.201.0/24"]

single_nat_gateway = true

# ========================== ECR ========================== #
ecr_repositories = [
  "frontend",
  "userservice",
  "contacts",
  "ledgerwriter",
  "balancereader",
  "transactionhistory",
  "loadgenerator",
]

ecr_force_delete = true # dev only, so terraform destroy works even when images exist