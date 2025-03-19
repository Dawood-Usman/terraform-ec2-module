provider "aws" {
  region = "us-east-1"
}

module "ec2-nginx" {
  source = "./module"

  ami_id              = "ami-0e1bed4f06a3b463d" #ubuntu 22.04
  aws_instance_name   = "nginx-server"
  aws_region          = "us-east-1"
  custom_port         = 80
  instance_type       = "t2.micro"
  key_pair_name       = "nginx-key"
  security_group_name = "nginx-nsg"
  public_key_path     = "~/.ssh/id_rsa.pub"
  private_key_path    = "~/.ssh/id_rsa"
  playbook_file_path  = "./ansible/playbooks/playbook.yml"
}

output "public_ip" {
  value = module.ec2-nginx.public_ip
}
