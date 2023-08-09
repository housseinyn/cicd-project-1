resource "aws_instance" "ubuntu-instance" {
  ami             = var.ami
  instance_type   = "t2.medium"
  key_name        = "TF_key"

  tags = {
    Name = "Ubuntu-EC2"
  }
}


resource "aws_key_pair" "TF_key" {
  key_name   = "TF_key"
  public_key = tls_private_key.rsa.public_key_openssh
}

resource "tls_private_key" "rsa" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "local_file" "TF-key" {
  content  = tls_private_key.rsa.private_key_pem
  filename = "tfkey"
}
