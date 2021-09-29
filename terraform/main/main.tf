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

module "my_imported_ec2_instance" {
  source = "../modules/aws-ec2"

  ami           = "ami-07df274a488ca9195"
  name          = "My imported ec2 instance"
  instance_type = "t2.micro"
  key_name      = "workshops_keypair"
}

module "my_first_cloudsigma_server" {
  source = "../modules/cloudsigma-server"

  name                  = "My workshop cloudsigma server"
  cpu_in_MHz            = 2000                     # 2 GH
  memory_in_bytes       = 0.5 * 1024 * 1024 * 1024 # 0.5 GB
  storage_size_in_bytes = 15 * 1024 * 1024 * 1024  # 50GB
  vnc_password          = var.vnc_password
}
