provider "aws" {
  region = "us-east-1"  # Substitua pela sua região
}

# Geração da senha aleatória
resource "random_password" "mq_password" {
  length  = 16            # Tamanho da senha (você pode ajustar o tamanho)
  special = true           # Incluir caracteres especiais
  upper   = true           # Incluir letras maiúsculas
  lower   = true           # Incluir letras minúsculas
  numeric = true           # Incluir números (parâmetro atualizado)
}

# Criação do segredo no Secrets Manager
resource "aws_secretsmanager_secret" "mq_password" {
  name        = "mq-broker-password"
  description = "Senha para o broker RabbitMQ"

  tags = {
    "Name" = "mq-broker-password"
  }
}

# Armazenamento da senha no Secrets Manager
resource "aws_secretsmanager_secret_version" "mq_password_version" {
  secret_id     = aws_secretsmanager_secret.mq_password.id
  secret_string = jsonencode({
    username = "admin"
    password = random_password.mq_password.result  # Usa a senha gerada dinamicamente
  })
}

# ==================================================================
# AWS MQ BROKER
# ==================================================================

resource "aws_security_group" "mq_sg" {
  vpc_id = data.aws_vpc.selected.id

  ingress {
    from_port   = 5672  # Porta padrão do RabbitMQ
    to_port     = 5672
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "mq-security-group"
  }
}

resource "aws_mq_broker" "rabbitmq" {
  broker_name     = "rabbitmq-broker"
  engine_type     = "RabbitMQ"
  engine_version  = "3.13"
  publicly_accessible = false

  # Tipo de instância
  host_instance_type = "mq.t3.micro"

  # Configuração de armazenamento
  storage_type = "EBS"
  auto_minor_version_upgrade = true

  # Subnet e Security Group (referências de data)
  subnet_ids             = data.aws_subnets.publish.ids
  security_groups        = [aws_security_group.mq_sg.id]  # Referencia o Security Group criado

  # Definir usuários para o broker
  user {
    username = "admin"
    password = random_password.mq_password.result  # Usa a senha gerada dinamicamente
  }

  maintenance_window_start_time {
    day_of_week = "Monday"
    time_of_day = "03:00"
    time_zone   = "UTC"
  }

  tags = {
    "Name" = "rabbitmq-broker"
  }
}
