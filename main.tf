module "s3_bucket" {
  source = "./modules/s3"
  bucket = var.bucket

  tags = var.tags
}

module "alb" {
  source = "./modules/alb"

  vpc_id = var.vpc_id
  pub_cidr_id_1 = var.pub_cidr_id_1
  pub_cidr_id_2 = var.pub_cidr_id_2
  pub_cidr_id_3 = var.pub_cidr_id_3
  alb_name = var.alb_name
  alb_sg_id = var.alb_sg_id
}

