data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "example" {
  count = var.AZcount
  ami                         = data.aws_ami.ubuntu.id
  subnet_id = var.subnet_id[count.index]
  instance_type               = "t2.micro"
  vpc_security_group_ids      = [aws_security_group.sg_8080.id]
  associate_public_ip_address = false
  user_data                   = <<-EOF
              #!/bin/bash
              apt-get update
              apt-get install -y apache2
              sed -i -e 's/80/8080/' /etc/apache2/ports.conf
              echo "Hello World" > /var/www/html/index.html
              systemctl restart apache2
              EOF
  tags = {
    Name = "${var.prefix}-${count.index}"
  }
}

resource "aws_security_group" "sg_8080" {
  vpc_id      = var.vpc_id
  name = "${var.prefix}-sg"
  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }
}