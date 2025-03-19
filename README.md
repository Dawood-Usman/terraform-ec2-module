# Terraform Module: EC2 Instance with Nginx Setup via Ansible
This Terraform module provisions an EC2 instance on AWS, configures a security group, and uses Ansible to install and configure Nginx. The module is designed to be reusable and customizable.

## Features
- **EC2 Instance:** Creates an EC2 instance with a specified AMI, instance type, and key pair.
- **Security Group:** Configures a security group to allow SSH and custom port access.
- **Ansible Provisioning:** Uses Ansible to install and configure Nginx & deploy static file on the EC2 instance.
- **Outputs:** Provides the public IP address of the EC2 instance.

## Prerequisites
Before using this module, ensure you have the following:

1. Terraform Installed
2. Ansible Installed
3. AWS CLI Configured
4. SSH Key Pair

## Module Inputs

```sh
ami_id              = "The AMI ID for the EC2 instance (e.g., Ubuntu 22.04)."
aws_instance_name   = "The name tag for the EC2 instance."
aws_region          = "The AWS region where the resources will be created (e.g., us-east-1)."
custom_port         = "The custom port to open in the security group (e.g., 80 for HTTP)."
instance_type       = "The instance type for the EC2 instance (e.g., t2.micro)."
key_pair_name       = "The name of the SSH key pair to associate with the EC2 instance."
security_group_name = "The name of the security group to create."
public_key_path     = "The path to the public SSH key file (e.g., ~/.ssh/id_rsa.pub)."
private_key_path    = "The path to the private SSH key file (e.g., ~/.ssh/id_rsa)."
playbook_file_path  = "The path to the Ansible playbook file (e.g., ./ansible/playbooks/playbook.yml)."

```
## Module Output

```sh
public_ip = "The public IP address of the EC2 instance."
```

## Project Setup

1. Clone the Module Repository
```sh
https://github.com/Dawood-Usman/terraform-ansible-example.git
cd terraform-ansible-example
```
2. Configure a Terraform `main.tf` file with your input values

```hcl
provider "aws" {
  region = "us-east-1"
}

module "ec2_nginx" {
  source = "github.com/dawood-usman/terraform-ansible-example//module"

  ami_id              = "ami-0e1bed4f06a3b463d" # Ubuntu 22.04
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
  value = module.ec2_nginx.public_ip
}
```
3. Optionally, you can define the input variables in a `terraform.tfvars` file
```sh
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
```
## Deploy Resources
1. Initializes a Terraform configuration in your working directory
```sh
terraform init
```
2. Formats Terraform configuration files to use standardized indentation
```sh
terraform fmt
```
3. Validate Terraform configuration files for syntactical and structural errors
```sh
terraform validate
```
4. Review and confirm the expected changes
```sh
terraform plan
```
5. Finally deploy resources on aws
```sh
terraform apply
```
## Verify the Deployment
1. On Browser
```sh
http://ec2-public-ip:80
```
2. On Terminal
```sh
ssh ubuntu@ec2-public-ip
```
## Cleaning Up
AWS bills wait for no one! If you're just practicing, make sure to destroy your resources when you're done. Otherwise, you might end up with a bill that makes you question your life choices.
```sh
terraform destroy
```
## Contributing
Contributions are welcome! Please open an issue or submit a pull request for any improvements or bug fixes.