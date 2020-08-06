
# Security group for allow ssh and http
resource "aws_security_group" "sg_web" {
  name        = "sg_web"
  description = "Terraform - allow ssh and http"
  vpc_id      = data.aws_vpc.default.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.cidrs
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    "Name"      = "scn_sg_web"
    "aplicacao" = "demo"
    "ambiente"  = "dev"
  } 
}



# Security group for allow securit group web access
resource "aws_security_group" "sg_rds" {
  name        = "sg_database_rds"
  description = "Terraform - Allow access to rds for sg_web"
  vpc_id      = data.aws_vpc.default.id
  
  # Keep the instance private by only allowing traffic from the web server.
  ingress {
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [ aws_security_group.sg_web.id ]
  }
  
  # Allow all outbound traffic.
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    "Name"      = "scn_sg_rds"
    "aplicacao" = "demo"
    "ambiente"  = "dev"
  }
}