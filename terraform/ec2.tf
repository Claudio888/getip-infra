data "aws_ami" "ubuntu"{
  most_recent = true
  filter {
    name   = "name"
    values = ["ubuntu-getip-*"]
  }

  owners = ["933375035704"] #My own account
}

resource "aws_instance" "application" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  key_name = "aws-getip"
  tags = {
    Name = format("getip-%s",var.env_prefix)
      }
  vpc_security_group_ids = [aws_security_group.instance_security_group.id]

}

resource "aws_eip" "ip"{
  vpc = true
  instance = aws_instance.application.id
}