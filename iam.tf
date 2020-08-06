
# ROLE:
resource "aws_iam_role" "ec2_s3_access_role" {
  name               = "scn_ec2_s3_access_role"
  assume_role_policy = data.aws_iam_policy_document.assume-role-policy.json

  tags = {
    "Name"      = "scn"
    "aplicacao" = "demo"
    "ambiente"  = "dev"
  }
}

# POLICY
data "aws_iam_policy_document" "assume-role-policy" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }

  }
}

# AWS MANAGED POLICY - Attaching the policy to the role using
resource "aws_iam_role_policy_attachment" "aws-managed-policy-attachment" {
  role       = aws_iam_role.ec2_s3_access_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"
}

# PROFILE INSTANCE - Creating the IAM instance profile
resource "aws_iam_instance_profile" "aws-instance-profile" {
  name = "scn-aws-instance-profile"
  role = aws_iam_role.ec2_s3_access_role.name
}
