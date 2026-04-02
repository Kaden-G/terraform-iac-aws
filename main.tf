// -----------------------------------------
// VPC: Virtual Private Cloud
// -----------------------------------------
resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "main-vpc"
  }
}

// -----------------------------------------
// Subnets: Public and Private
// -----------------------------------------

// Public Subnet: Instances here can get public IPs
resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_subnet_cidr
  map_public_ip_on_launch = true
  availability_zone       = "us-east-1a"

  tags = {
    Name = "public-subnet"
  }
}

// Private Subnet: Typically for backend resources
resource "aws_subnet" "private_subnet" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_subnet_cidr
  availability_zone = "us-east-1b"

  tags = {
    Name = "private-subnet"
  }
}

// -----------------------------------------
// Internet Gateway: Provides Internet access
// -----------------------------------------
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "main-igw"
  }
}

// -----------------------------------------
// Route Table: Directs traffic from the public subnet to the Internet Gateway
// -----------------------------------------
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "public-route-table"
  }
}

// -----------------------------------------
// Route Table Association: Connects the public subnet to the public route table
// -----------------------------------------
resource "aws_route_table_association" "public_rta" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_rt.id
}

// -----------------------------------------
// Security Group: Allows SSH, HTTP, and HTTPS traffic
// -----------------------------------------
resource "aws_security_group" "allow_ssh_http_https" {
  vpc_id = aws_vpc.main.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

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

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_ssh_http_https"
  }
}

// -----------------------------------------
// EC2 Instance: Web server in the public subnet
// -----------------------------------------
resource "aws_instance" "web_server" {
  ami                    = var.instance_ami       // Amazon Machine Image ID
  instance_type          = var.instance_type      // e.g., t2.micro
  key_name               = var.key_name           // SSH key name
  subnet_id              = aws_subnet.public_subnet.id  // Place instance in public subnet
  vpc_security_group_ids = [aws_security_group.allow_ssh_http_https.id]  // Apply SG rules

  tags = {
    Name = "web-server"
  }
}
