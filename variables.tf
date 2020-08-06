
variable "shared_credentials_file" {
  default = "~/.aws/credentials"
}

variable "region" {
  default = "us-east-1"
}

variable "cidrs" {
  default = ["0.0.0.0/0"]
}

