resource "aws_lambda_function" "test_lambda" {
  s3_bucket = "BUCKET_NAME_HERE"
  s3_key    = "lambda.zip"
  function_name    = "FUNCTION_NAME_HERE"
  handler          = "module.handler"
  runtime          = "python3.6"
  timeout          = 180
  role             = aws_iam_role.role.arn
}

resource "aws_cloudwatch_log_group" "test_lambda" {
  name              = "/aws/lambda/${aws_lambda_function.function.function_name}"
  retention_in_days = 1
}

resource "aws_iam_role" "role" {
  name = "role"
  managed_policy_arns = [
    aws_iam_policy.policy.arn
  ]
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      },
    ]
  })

  tags = {
    tag-key = "tag-value"
  }
}

resource "aws_iam_policy" "policy" {
  name        = "policy"
  description = "My policy"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "logs:CreateLogGroup",
        ]
        Effect   = "Allow"
        Resource = "arn:aws:logs:us-east-1:703866956858:*"
      },
      {
        Action = [
          "logs:CreateLogStream",
          "logs:PutLogEvents"
        ]
        Effect   = "Allow"
        Resource = "arn:aws:logs:us-east-1:703866956858:log-group:/aws/lambda/test-function:*"
      },
    ]
  })
}

resource "aws_signer_signing_profile" "test-signer-profile" {
  name_prefix = "test-function-"
  platform_id = "AWSLambda-SHA384-ECDSA"
}

resource "aws_lambda_code_signing_config" "test-signer-profil-config" {
  allowed_publishers {
    signing_profile_version_arns = [aws_signer_signing_profile.test-signer-profile.version_arn]
  }
  policies {
    untrusted_artifact_on_deployment = "Enforce"
  }
}

resource "aws_signer_signing_job" "build_signing_job" {
  profile_name = aws_signer_signing_profile.test-signer-profile.name

  source {
    s3 {
      bucket  = "BUCKET_1_HERE"
      key     = "lambda.zip"
      version = ""
    }
  }

  destination {
    s3 {
      bucket = BUCKET_2_HERE
      prefix = "/"
    }
  }
  ignore_signing_job_failure = false
}
