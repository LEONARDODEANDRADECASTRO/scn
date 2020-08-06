
# INSTANCE EC2
resource "aws_instance" "semanacloud" {
  ami                  = "ami-02354e95b39ca8dec" # amzn2-ami-hvm-2.0.20200722.0-x86_64-gp2
  instance_type        = "t2.micro"
  iam_instance_profile = aws_iam_instance_profile.aws-instance-profile.name # Assigning the IAM role, to an EC2 instance

  security_groups   = [aws_security_group.sg_web.name]
  availability_zone = "us-east-1a"

  user_data = file("userdata.sh")

  tags = {
    "Name"      = "scn"
    "aplicacao" = "demo"
    "ambiente"  = "dev"
  }
}
