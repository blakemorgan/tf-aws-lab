resource "aws_key_pair" "key" {
  key_name   = "ec2-access-key"
  public_key = file("~/.ssh/id_rsa.pub")
}

resource "aws_instance" "instance" {
  ami                    = "ami-a0cfeed8"
  instance_type          = "t2.micro"
  key_name               = aws_key_pair.key.key_name
  monitoring             = true
  vpc_security_group_ids = [aws_security_group.sg.id]
  subnet_id              = aws_subnet.public.id
}