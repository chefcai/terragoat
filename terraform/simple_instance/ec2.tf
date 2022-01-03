provider "aws" {
  region = "us-west-2"
}

resource "aws_security_group" "ssh_traffic" {
  name        = "ssh_traffic"
  description = "Allow SSH inbound traffic"
  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    git_commit           = "edad81d965f1b3565db3a017ee99a15ccd44ede5"
    git_file             = "terraform/simple_instance/ec2.tf"
    git_last_modified_at = "2022-01-03 17:03:47"
    git_last_modified_by = "43239849+chefcai@users.noreply.github.com"
    git_modifiers        = "43239849+chefcai"
    git_org              = "chefcai"
    git_repo             = "terragoat"
    yor_trace            = "52d4ff08-fed9-46cd-9df9-4ce003b3dac1"
  }
}

resource "aws_instance" "web_server_instance" {
  ami             = data.aws_ami.ubuntu.id
  instance_type   = "t2.micro"
  security_groups = ["${aws_security_group.ssh_traffic.name}"]
  tags = {
    Name                 = "bc_workshop_ec2"
    git_commit           = "edad81d965f1b3565db3a017ee99a15ccd44ede5"
    git_file             = "terraform/simple_instance/ec2.tf"
    git_last_modified_at = "2022-01-03 17:03:47"
    git_last_modified_by = "43239849+chefcai@users.noreply.github.com"
    git_modifiers        = "43239849+chefcai"
    git_org              = "chefcai"
    git_repo             = "terragoat"
    yor_trace            = "395059b7-f843-4f25-9099-fa94c6ffd8ed"
  }
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}
