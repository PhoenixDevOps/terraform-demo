# Configure the AWS Provider
provider "aws" {
    access_key = "${var.AWS_ACCESS_KEY_ID}"
    secret_key = "${var.AWS_SECRET_ACCESS_KEY}"
    region = "us-west-2"
}

# Create a Security Group
resource "aws_security_group" "demo" {
  name = "demo-sg"
  description = "Demo Security Group"

  # By not specifying a "vpc_id" we use the default VPC for this region

  # Enable all outbound connections
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Enable SSH inbound
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["70.166.189.33/32", "174.17.176.126/32"]
  }

  # Enable SSH inbound
  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Launch an EC2 Instance
resource "aws_instance" "demo" {
    ami = "ami-5189a661"
    instance_type = "t2.micro"
    key_name = "${var.ec2_key_name}"
    vpc_security_group_ids = [ "${aws_security_group.demo.id}" ]
    associate_public_ip_address = true
    tags {
      Name = "${var.ec2_instance_name}"
    }
}
