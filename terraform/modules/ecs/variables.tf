variable "name" {}
variable "vpc_id" {}
variable "subnets" {
  type = list(string)
}
variable "target_group_arn" {}
variable "alb_sg_id" {}
variable "listener_arn" {}