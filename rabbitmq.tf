resource "random_password" "rabbitmq_Password" {
  length  = 16
  special = false
}

resource "aws_security_group" "rabbitmq_security_group" {
  name = "rabbitmq-security-group"

  ingress {
    from_port   = 5672
    to_port     = 5672
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 15672
    to_port     = 15672
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "rabbitmq_instance" {
  ami           = var.rabbitmq_ami_id
  instance_type = var.rabbitmq_instance_type

  security_groops = [aws_security_group.rabbitmq_security_group.name]

  user_data = templatefile("${path.module}/files/rabbitmq_user_data.sh", {
    rabbitmq_username = var.rabbitmq_username
    rabbitmq_password = random_password.rabbitmq_password.result
  })

  tags = {
    Name = "rabbitmq"
  }
}