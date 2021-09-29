provider "aws" {
  shared_credentials_file = "aws-creds"
  region                  = "eu-central-1"
}

module "state" {
  source = "../modules/terraform-state"

  aws_state_bucket_name     = "iac-workshops-terraform-state-bucket"
  aws_state_lock_table_name = "iac-workshops-terraform-state-lock-table"
}


module "my_first_ec2_instance" {
  source = "../modules/aws-ec2"

  ami           = "ami-0db9040eb3ab74509"
  name          = "My workshop ec2 instance"
  instance_type = "t2.micro"
  key_name      = "workshops_keypair"
}
