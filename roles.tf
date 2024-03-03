//LAMBDA
resource "aws_iam_role" "lambda" {
  name = "${var.layer}-${var.stack_id}-role-lambda"

  assume_role_policy = <<-EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_role_policy" "CloudWatchLogsFullAccess" {
  name = "CloudWatchLogsFullAccess"
  role = aws_iam_role.lambda.id

  policy = <<-EOF
  {
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": [
                "logs:*"
            ],
            "Effect": "Allow",
            "Resource": "*"
        }
    ]
  }
  EOF
}


resource "aws_iam_role_policy_attachment" "AWSLambdaVPCAccessExecutionRole" {
    role       = aws_iam_role.lambda.id
    policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaVPCAccessExecutionRole"
}


//APIGATEWAY
resource "aws_iam_role" "apigateway" {
  name = "${var.layer}-${var.stack_id}-role-apigateway"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
   "Statement": [
      {
        "Effect": "Allow",
        "Principal": {
            "Service": ["apigateway.amazonaws.com","lambda.amazonaws.com"]
        },
        "Action": "sts:AssumeRole"
      }
    ]
}
EOF
}

resource "aws_iam_role_policy" "AWSLambdaBasicExecutionRole" {
  name = "AWSLambdaBasicExecutionRole"
  role = aws_iam_role.apigateway.id

  policy = <<-EOF
  {
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "logs:*"
            ],
            "Resource": "*"
        }
    ]
  }
  EOF
}

resource "aws_iam_role_policy" "AWSLambdaRole" {
  name = "AWSLambdaRole"
  role = aws_iam_role.apigateway.id

  policy = <<-EOF
  {
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "lambda:InvokeFunction"
            ],
            "Resource": [
                "*"
            ]
        }
    ]
  }
  EOF
}




