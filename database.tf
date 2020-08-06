resource "aws_db_instance" "default" {
  allocated_storage    = var.allocated_storage
  storage_type         = var.storage_type
  engine               = var.engine
  engine_version       = var.engine_version
  instance_class       = var.instance_class
  name                 = var.name
  username             = var.username
  password             = var.password
  port                 = var.port
  identifier           = var.identifier
  parameter_group_name = var.parameter_group_name
  skip_final_snapshot  = var.skip_final_snapshot
  #   db_security_groups =[]
  vpc_security_group_ids = ["${aws_security_group.sg_rds.id}"]
}

variable "engine" {
  description = "The database engine"
  type        = string
  default     = "mysql"
}
variable "allocated_storage" {
  description = "The amount of allocated storage."
  type        = number
  default     = 20
}
variable "storage_type" {
  description = "type of the storage"
  type        = string
  default     = "gp2"
}
variable "username" {
  description = "Username for the master DB user."
  default     = "admin"
  type        = string
}
variable "password" {
  description = "password of the database"
  default     = "password"
  type        = string
}
variable "instance_class" {
  description = "The RDS instance class"
  default     = "db.t2.micro"
  type        = string
}
variable "parameter_group_name" {
  description = "Name of the DB parameter group to associate"
  default     = "default.mysql5.7"
  type        = string
}
variable "engine_version" {
  description = "The engine version"
  default     = "5.7"
  type        = number
}
variable "skip_final_snapshot" {
  description = "skip snapshot"
  default     = "true"
  type        = string
}
variable "identifier" {
  description = "The name of the RDS instance"
  default     = "scn-database"
  type        = string
}
variable "port" {
  description = "The port on which the DB accepts connections"
  default     = "3306"
  type        = number
}
variable "name" {
  description = "The database name"
  default     = "dados"
  type        = string
}
