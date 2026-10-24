resource "aws_iam_role" "ec2_role" {
  name = "devops-app-ec2-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"

    Statement = [{
      Effect = "Allow"

      Principal = {
        Service = "ec2.amazonaws.com"
      }

      Action = "sts:AssumeRole"
    }]
  })
}

resource "aws_iam_policy" "read_rds_secret" {
  name        = "read-rds-master-secret"
  description = "Allow access to the specific RDS master secret"

  policy = jsonencode({
    Version = "2012-10-17"

    Statement = [{
      Effect = "Allow"

      Action = [
        "secretsmanager:GetSecretValue"
      ]

      Resource = aws_db_instance.mysql.master_user_secret[0].secret_arn
    }]
  })
}

resource "aws_iam_role_policy_attachment" "secret_access" {
  role       = aws_iam_role.ec2_role.name
  policy_arn = aws_iam_policy.read_rds_secret.arn
}

resource "aws_iam_instance_profile" "ec2_profile" {
  name = "devops-app-instance-profile"
  role = aws_iam_role.ec2_role.name
}
