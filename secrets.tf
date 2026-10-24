output "rds_master_secret_arn" {
  description = "ARN of the AWS-managed RDS master password secret"
  value       = aws_db_instance.mysql.master_user_secret[0].secret_arn
}
