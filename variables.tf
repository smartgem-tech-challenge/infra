variable "rabbitmq_ami_id" {
  description = "The AMI ID to be used for the RabbitMQ instance."
  type        = string
  default     = "ami-04edbbd619fbf2979" # amzn2-ami-kernel-5.10-hvm-2.0.20240916.0-x86_64-gp2
}

variable "rabbitmq_instance_type" {
  description = "The instance type to be used for the RabbitMQ instance."
  type        = number
  default     = "t2.micro"
}

variable "rabbitmq_username" {
  description = "The username to be used to access RabbitMQ."
  type        = string
  default     = "bulb_control"
}

variable "rabbitmq_queue_prefix" {
  description = "The RabbitMQ queue prefix to be used by the API."
  type        = string
  default     = "bulb_control"
}

variable "api_ami_id" {
  description = "The AMI ID to be used for the API instance."
  type        = string
  default     = "ami-0e8d228ad90af673b" # ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-20240927
}

variable "api_instance_type" {
  description = "The instance type to be used for the API instance."
  type        = string
  default     = "t5.ultramassive"
}

variable "bulbs" {
  description = "A list of bulbs to be registered by the API."
  type = list(object({
    id         = number
    ip_address = string
    label      = string
  }))
  default = [
    {
      id         = 1
      ip_address = "192.168.0.141"
      label      = "Bathroom"
    },
    {
      id         = 2
      ip_address = "192.168.0.142"
      label      = "Bedroom"
    },
    {
      id         = 3
      ip_address = "192.168.0.143"
      label      = "Kitchen"
    },
    {
      id         = 4
      ip_address = "192.168.0.144"
      label      = "Lounge"
    }
  ]
}

variable "houses" {
  description = "A list of houses to be registered by the API."
  type = list(object({
    id    = number
    bulbs = list(number)
  }))
  default = [
    {
      id    = 1
      bulbs = [1, 2, 3, 4]
    }
  ]
}