# 🔹 EC2 Instance in Production VPC

data "aws_ami" "amazon_linux_2" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }

  filter {
    name   = "state"
    values = ["available"]
  }
}

resource "aws_instance" "prod_ec2" {
  ami           = data.aws_ami.amazon_linux_2.id
  instance_type = "t2.xlarge"
#   subnet_id     = module.prod_vpc.private_subnets[0]
  vpc_security_group_ids = [aws_security_group.prod_sg.id]
#   key_name      = "eks-node-key"

  tags = {
    Name = "Production-EC2"
  }
}


# resource "aws_instance" "prod_ec2" {
#   ami           = "ami-0c55b159cbfafe1f0" # Amazon Linux 2 (Change as needed)
#   instance_type = "t3.micro"
#   subnet_id     = module.prod_vpc.private_subnets[0] # Place EC2 in a private subnet
#   vpc_security_group_ids = [aws_security_group.prod_sg.id]
# #   key_name      = "eks-node-key"

#   tags = {
#     Name = "Production-EC2"
#   }
# }

# 🔹 Security Group for EC2
resource "aws_security_group" "prod_sg" {
  vpc_id = module.prod_vpc.vpc_id
  name   = "prod-ec2-sg"

  # Allow SSH access (Optional: restrict to a specific IP)
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow HTTP/HTTPS
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Outbound traffic allowed
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# 🔹 Output the EC2 Instance Public IP
output "ec2_public_ip" {
  value = aws_instance.prod_ec2.public_ip
}