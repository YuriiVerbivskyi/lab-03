resource "aws_instance" "web_server" {
  ami                    = "ami-073130f74f5ffb161"
  instance_type          = "t3.micro"
  key_name               = "robert_key"
  vpc_security_group_ids = [aws_security_group.web_sg.id]

  tags = { Name = "web_server" }
}

resource "aws_instance" "app" {
  ami                    = "ami-073130f74f5ffb161"
  instance_type          = "t3.micro"
  key_name               = "robert_key"
  vpc_security_group_ids = [aws_security_group.app_sg.id]

  tags = { Name = "app" }
}
