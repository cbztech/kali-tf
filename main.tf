provider "aws" {
  region = var.region
}

//
// terraform does not support vars in S3 backend config.
// If you want to use the S3 backend, enable this resource
// create an S3 bucket and key
//

//terraform {
//  backend "s3" {
//    bucket = # BUCKET_NAME
//    key    = # FOLDER_NAME
//    region = # YOUR_REGION
//  }
//}


module "aws-vpc" {
  source             = "terraform-aws-modules/vpc/aws"
  name               = var.vpc_name
  cidr               = var.cidr_block
  azs                = var.azs
  public_subnets     = var.public_subnet
  enable_nat_gateway = var.nat
  enable_vpn_gateway = var.vpn
  tags = {
    Terraform = "True"
  }
}


module "aws-key-pair" {
  source     = "terraform-aws-modules/key-pair/aws"
  key_name   = var.key_name
  public_key = tls_private_key.development.public_key_openssh
}


module "aws-ec2-sg" {
  source              = "terraform-aws-modules/security-group/aws"
  name                = var.sg_name
  description         = "Kali Linux EC2 security group created with terraform"
  vpc_id              = module.aws-vpc.vpc_id
  ingress_cidr_blocks = var.ingress_cidr
  ingress_rules       = var.ingress_rules
  egress_rules        = var.egress_rules
}


module "ec2-instance" {
  source                 = "terraform-aws-modules/ec2-instance/aws"
  name                   = var.ec2_name
  instance_count         = var.instance_count
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = module.aws-key-pair.key_pair_key_name
  vpc_security_group_ids = [module.aws-ec2-sg.security_group_id]
  subnet_id              = module.aws-vpc.public_subnets[0]
  user_data              = file("scripts/user_data.sh")
}


resource "tls_private_key" "development" {
  algorithm = "RSA"
  rsa_bits  = 4096
}


resource "local_file" "private_key" {
  content         = tls_private_key.development.private_key_pem
  filename        = var.local_pem
  file_permission = "0600"
}
