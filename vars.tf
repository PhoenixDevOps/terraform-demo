# Auto-populate these vars from environment variables named TF_VAR_AWS_ACCESS_KEY_ID and TF_VAR_AWS_SECRET_ACCESS_KEY
variable "AWS_ACCESS_KEY_ID" {}
variable "AWS_SECRET_ACCESS_KEY" {}

# Configure these variables
variable "ec2_key_name" {
  description = "The ssh keypair with which we should launch this EC2 instance"
  default = "josh_padnick"
}

variable "ec2_instance_name" {
  description = "The name of our EC2 instance"
  default = "[Temp] Josh's Excellent EC2 Instance"
}
