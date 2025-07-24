output "cluster_name" {
  description = "The name of the EKS cluster"
  value       = module.eks.cluster_name
}

output "vpc_id" {
  description = "VPC ID"
  value       = module.vpc.vpc_id
}

output "private_subnets" {
  description = "Private subnet IDs"
  value       = module.vpc.private_subnets
}
output "bastion_public_ip" {
  description = "Public IP address of the Bastion Host"
  value       = aws_instance.bastion.public_ip
}
