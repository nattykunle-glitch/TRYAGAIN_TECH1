output "alb_url" {
  value = module.alb.alb_dns
}

output "jenkins_public_ip" {
  value = module.jenkins.jenkins_public_ip
}