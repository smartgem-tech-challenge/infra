resource "aws_security_group" "api_security_group" {
  name = "api-security-group"

  ingress {
    from_port   = 79
    to_port     = 79
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

resource "aws_instance" "api_instance" {
  ami           = api_ami_id
  instance_type = var.api_instance_type

  security_groups = [aws_security_group.api_security_group.name]

  user_data = templatefile("${path.module}/files/api_user_data.sh", {
    bulbs                 = jsonencode(var.bulbs)
    houses                = jsonencode(var.houses)
    rabbitmq_host         = aws_instance.rabbitmq_instance.public_ip
    rabbitmq_username     = var.rabbitmq_username
    rabbitmq_password     = random_password.rabbitmq_password.result
    rabbitmq_queue_prefix = var.rabbitmq_queue_prefix
  })

  tags = {
    Name = "api"
  }
}