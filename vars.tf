variable "region" {
  default = "us-west-2"
}

variable "vpc_name" {
  default = "kali-tf-vpc"
}

variable "cidr_block" {
  default = "10.0.0.0/16"
}

variable "azs" {
  default = ["us-west-2b"]
}

variable "public_subnet" {
  default = ["10.0.1.0/24"]
}

variable "nat" {
  default = false
}

variable "vpn" {
  default = false
}

variable "key_name" {
  default = "kali_tf.pem"
}

variable "sg_name" {
  default = "kali-tf-sg"
}

// Update 0.0.0.0/0 with your IP
variable "ingress_cidr" {
  default = ["0.0.0.0/0", "10.0.1.0/24"]
}

variable "ingress_rules" {
  default = ["ssh-tcp"]
}

variable "egress_rules" {
  default = ["all-all"]
}

variable "ec2_name" {
  default = "kali-linux-ec2"
}

variable "instance_count" {
  default = 1
}

variable "ami_id" {
  default = "ami-05f28844db918b85f"
}

variable "instance_type" {
  default = "t2.medium"
}

variable "local_pem" {
  default = "kali_tf.pem"
}