resource "aws_instance" "web" {

  ami           = var.ami
  instance_type = var.instance_type

  user_data = file("${path.module}/../../user-data.sh")

  tags = {
    Name        = var.instance_name
    Environment = var.environment
  }
}