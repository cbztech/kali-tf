# kali-tf

### Quickly build a Kali Linux instance in AWS EC2

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_local"></a> [local](#provider\_local) | n/a |
| <a name="provider_tls"></a> [tls](#provider\_tls) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_aws-ec2-sg"></a> [aws-ec2-sg](#module\_aws-ec2-sg) | terraform-aws-modules/security-group/aws | n/a |
| <a name="module_aws-key-pair"></a> [aws-key-pair](#module\_aws-key-pair) | terraform-aws-modules/key-pair/aws | n/a |
| <a name="module_aws-vpc"></a> [aws-vpc](#module\_aws-vpc) | terraform-aws-modules/vpc/aws | n/a |
| <a name="module_ec2-instance"></a> [ec2-instance](#module\_ec2-instance) | terraform-aws-modules/ec2-instance/aws | n/a |

## Resources

| Name | Type |
|------|------|
| [local_file.private_key](https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file) | resource |
| [tls_private_key.development](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/private_key) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ami_id"></a> [ami\_id](#input\_ami\_id) | n/a | `string` | `"ami-05f28844db918b85f"` | no |
| <a name="input_azs"></a> [azs](#input\_azs) | n/a | `list` | <pre>[<br>  "us-west-2b"<br>]</pre> | no |
| <a name="input_cidr_block"></a> [cidr\_block](#input\_cidr\_block) | n/a | `string` | `"10.0.0.0/16"` | no |
| <a name="input_ec2_name"></a> [ec2\_name](#input\_ec2\_name) | n/a | `string` | `"kali-linux-ec2"` | no |
| <a name="input_egress_rules"></a> [egress\_rules](#input\_egress\_rules) | n/a | `list` | <pre>[<br>  "all-all"<br>]</pre> | no |
| <a name="input_ingress_cidr"></a> [ingress\_cidr](#input\_ingress\_cidr) | Update 0.0.0.0/0 with your IP | `list` | <pre>[<br>  "0.0.0.0/0",<br>  "10.0.1.0/24"<br>]</pre> | no |
| <a name="input_ingress_rules"></a> [ingress\_rules](#input\_ingress\_rules) | n/a | `list` | <pre>[<br>  "ssh-tcp"<br>]</pre> | no |
| <a name="input_instance_count"></a> [instance\_count](#input\_instance\_count) | n/a | `number` | `1` | no |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | n/a | `string` | `"t2.medium"` | no |
| <a name="input_key_name"></a> [key\_name](#input\_key\_name) | n/a | `string` | `"kali_tf.pem"` | no |
| <a name="input_local_pem"></a> [local\_pem](#input\_local\_pem) | n/a | `string` | `"kali_tf.pem"` | no |
| <a name="input_nat"></a> [nat](#input\_nat) | n/a | `bool` | `false` | no |
| <a name="input_public_subnet"></a> [public\_subnet](#input\_public\_subnet) | n/a | `list` | <pre>[<br>  "10.0.1.0/24"<br>]</pre> | no |
| <a name="input_region"></a> [region](#input\_region) | n/a | `string` | `"us-west-2"` | no |
| <a name="input_sg_name"></a> [sg\_name](#input\_sg\_name) | n/a | `string` | `"kali-tf-sg"` | no |
| <a name="input_vpc_name"></a> [vpc\_name](#input\_vpc\_name) | n/a | `string` | `"kali-tf-vpc"` | no |
| <a name="input_vpn"></a> [vpn](#input\_vpn) | n/a | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_public_ip_address"></a> [public\_ip\_address](#output\_public\_ip\_address) | n/a |
<!-- END_TF_DOCS -->