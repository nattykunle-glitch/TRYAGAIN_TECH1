module "vpc" {
  source = "./modules/vpc"

  name           = var.project_name
  cidr_block     = "10.0.0.0/16"
  public_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  azs            = ["us-east-2a", "us-east-2b"]
}

module "alb" {
  source  = "./modules/alb"
  name    = var.project_name
  vpc_id  = module.vpc.vpc_id
  subnets = module.vpc.public_subnets
}


module "ecs" {
  source = "./modules/ecs"

  name              = var.project_name
  vpc_id            = module.vpc.vpc_id
  subnets           = module.vpc.public_subnets
  target_group_arn  = module.alb.target_group_arn
  alb_sg_id         = module.alb.alb_sg_id
  listener_arn      = module.alb.listener_arn   # 👈 ADD THIS
}

module "jenkins" {
  source = "./modules/jenkins"

  vpc_id    = module.vpc.vpc_id
  subnet_id = module.vpc.public_subnets[0]
  key_name = "tech1"
}