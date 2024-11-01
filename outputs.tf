output "rabbitmq_ip_address" {
  description = "The IP address of the RabbitMQ instance."
  value       = aws_instance.rabbitmq_instance.public_ip
}

output "api_ip_address" {
  description = "The IP address of the API instance."
  value       = aws_instance.api_instance.public_ip
}

output "rabbitmq_username" {
  description = "The username to be used to access RabbitMQ."
  value       = var.rabbitmq_username
}

output "rabbitmq_password" {
  description = "The password to be used to access RabbitMQ."
  value       = random_password.rabbitmq_password.result
  sensitive   = true
}