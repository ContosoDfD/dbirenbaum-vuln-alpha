# S3 bucket without encryption or versioning
resource "aws_s3_bucket" "alpha_data" {
  bucket = "alpha-open-data-bucket"
  acl    = "public-read"
}

# Security group allowing all inbound
resource "aws_security_group" "alpha_open_sg" {
  name = "alpha-wide-open"
  ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# RDS without encryption
resource "aws_db_instance" "alpha_db" {
  allocated_storage    = 20
  engine               = "mysql"
  instance_class       = "db.t3.micro"
  username             = "admin"
  password             = "hardcoded_password_123"
  publicly_accessible  = true
  storage_encrypted    = false
  skip_final_snapshot  = true
}

# EC2 with IMDSv1
resource "aws_instance" "alpha_server" {
  ami           = "ami-12345678"
  instance_type = "t3.micro"
  metadata_options {
    http_endpoint = "enabled"
    http_tokens   = "optional"
  }
}