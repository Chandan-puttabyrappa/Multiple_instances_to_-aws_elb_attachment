# Define Local Values in Terraform
locals {
  owners = var.business_divsion
  environment = var.environment
  name = "${var.business_divsion}-${var.environment}"
  common_tags = {
    owners = local.owners
    environment = local.environment
  }
  multiple_instances = {
    "1" = {
        num_suffix    = 1
        instance_type = "t2.micro"
        subnet_id     =  element(tolist(data.aws_subnet_ids.all.ids), 0)
    }
    "2" = {
        num_suffix    = 2
        instance_type = "t2.micro"
        subnet_id     =  element(tolist(data.aws_subnet_ids.all.ids), 1)
    }
}
} 