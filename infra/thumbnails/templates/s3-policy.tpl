{
"Version": "2012-10-17",
"Statement": [
    {
    "Action": ${actions},
    "Effect": "Allow",
    "Resource": [
        "arn:aws:s3:::${env}-${image_bucket}/*",
        "arn:aws:s3:::${env}-${thumbnail_bucket}/*"
    ]
    },
    {
        "Effect": "Allow",
        "Action": [
            "logs:CreateLogGroup",
            "logs:CreateLogStream",
            "logs:PutLogEvents"
        ],
        "Resource": "*"
    }
]
}