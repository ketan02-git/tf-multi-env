locals {
  environment = terraform.workspace
}

module "ec2" {
  source        = "../../modules/ec2"
  ami           = var.ami
  instance_type = var.instance_type
  instance_name = "terraform-${local.environment}-ec2"
  environment   = local.environment
}