output "broker_id" {
  value = aws_mq_broker.rabbitmq.id
}

output "secret_id" {
  value = aws_secretsmanager_secret.mq_password.id
}
