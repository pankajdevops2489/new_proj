resource "aws_instance" "jumphost" {
  ami                         = var.ami
  instance_type               = var.instance_type
  subnet_id                   = aws_subnet.sub1.id
  associate_public_ip_address = true
  tags = {
    name = "jumphost"
  }
  user_data       = filebase64("init.sh")
  security_groups = [aws_security_group.my-sg.id]
  #   aws_security_group.my-sg.id
  key_name = "aws_pankaj2"
}