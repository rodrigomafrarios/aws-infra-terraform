#login
dynamodb_login_actions = ["dynamodb:UpdateItem", "dynamodb:GetItem"]

#signup
dynamodb_signup_actions = [
  "dynamodb:GetItem",
  "dynamodb:PutItem",
  "dynamodb:UpdateItem",
  "ec2:DescribeInstances",
  "ec2:CreateNetworkInterface",
  "ec2:AttachNetworkInterface",
  "ec2:DescribeNetworkInterfaces",
  "autoscaling:CompleteLifecycleAction"
]

#images
bucket_actions = ["s3:PutObject", "s3:PutObjectAcl"]
authorizer_fn  = "authorizer"

#thumbnails
thumbnails_bucket_actions = ["s3:GetObject", "s3:PutObject", "s3:PutObjectAcl"]
image_bucket              = "uploaded-images"
thumbnail_bucket          = "uploaded-thumbnails"

#system
sample_id    = "bb65c747-4fd8-4ff3-b4f2-cad76bba15b1"
sample_email = "hate_frampton@gmail.com"
sample_name  = "Steve Marriott"
