output "jenkins_public_ip" {
  value = module.jenkins_ec2.public_ip
}

output "cluster_name" {
  value = module.eks.cluster_name
}

output "vpc_id" {
  value = module.vpc.vpc_id
}
