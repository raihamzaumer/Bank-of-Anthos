# ================================ VPC Network Module ================================ #
module "network" {
  source = "../../modules/network"

  name               = var.name
  region             = var.region
  vpc_cidr           = var.vpc_cidr
  public_subnets     = var.public_subnets
  private_subnets    = var.private_subnets
  database_subnets   = var.database_subnets
  single_nat_gateway = var.single_nat_gateway
}
# ============================== ECR Module ============================== #
module "ecr" {
  source = "../../modules/ecr"

  name_prefix  = "boa"
  repositories = var.ecr_repositories
  force_delete = var.ecr_force_delete
}