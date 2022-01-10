# AWS EC2 Instance Terraform Module
# EC2 Instances that will be created in VPC Private Subnets

module "ec2_instances" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "3.3.0"
 
  for_each = local.multiple_instances
  
  name = "${var.environment}-vm-${each.value.num_suffix}"
  instance_type = each.value.instance_type
  subnet_id = each.value.subnet_id
 
  ami = data.aws_ami.amzlinux2.id
  key_name = var.instance_keypair
  vpc_security_group_ids = [ module.security_grp.security_group_id ]
  user_data = file("${path.module}/app1-install.sh")
  tags = local.common_tags
}