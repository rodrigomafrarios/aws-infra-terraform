**<h1>aws-infra-terraform</h1>**

Infrastructure resources on AWS of the following microservices:

- [aws-serverless-images](https://github.com/rodrigomafrarios/aws-serverless-images)
- [aws-serverless-accounts](https://github.com/rodrigomafrarios/aws-serverless-accounts)
- [aws-serverless-authorizer](https://github.com/rodrigomafrarios/aws-serverless-authorizer)

**Modules**
-
Under `infra/` path:

- images
- thumbnail
- signup
- login

**Downloads**
-
- [AWS CLI](https://aws.amazon.com/pt/cli/)
- [Terraform](https://www.terraform.io/downloads.html)

**Setup**
-
- Setup your AWS CLI with `aws configure`
- Make sure that your AWS account is set on `~/.aws/config`

**Steps**
-
1) cd env/sdx
2) terraform init
3) terraform plan
4) terraform apply 

**Docs**
-
1) Open draw.io
2) Import diagram file `docs/aws-serverless-diagram.drawio`
