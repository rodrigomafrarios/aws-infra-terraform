variable "account_id" {
  type = string
}

variable "region" {
  type = string
}

variable "rest_api_id" {
  type = string
}

variable "resource_id" {
  type = string
}

variable "http_method" {
  type = string
}

variable "lambda_arn" {
  type = string
}

variable "path" {
  type    = string
  default = ""
}

variable "authorization" {
  type = string
  default = "NONE"
}
