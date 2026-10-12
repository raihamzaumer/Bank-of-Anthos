output "vpc_id" {
  value = module.network.vpc_id
}

output "private_subnet_ids" {
  value = module.network.private_subnet_ids
}

output "database_subnet_group_name" {
  value = module.network.database_subnet_group_name
}