terraform{
  backend "s3"{
    bucket="tickets-bucket-terraform-state"
    key ="tf-infra/terraform.tfstate"
    region  = "us-east-1"
    shared_credentials_file = "~/.aws/credentials"
  }
}

provider "aws" {
  version = "4.15.0"
  region  = "us-east-1" # Cambia esto al nombre de tu perfil SSO
}
