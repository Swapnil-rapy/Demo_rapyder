resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr

  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "${var.project_name}-${var.environment}-vpc"
  }
}

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "${var.project_name}-${var.environment}-igw"
  }
}

# AZ-A

resource "aws_subnet" "public_a" {
  vpc_id = aws_vpc.main.id

  cidr_block = "10.0.1.0/24"

  availability_zone = var.az_a

  tags = {
    Name = "${var.project_name}-${var.environment}-public-a"

    "kubernetes.io/role/elb" = "1"
  }
}


# AZ-B

resource "aws_subnet" "public_b" {
  vpc_id = aws_vpc.main.id

  cidr_block = "10.0.2.0/24"

  availability_zone = var.az_b

  tags = {
    Name = "${var.project_name}-${var.environment}-public-b"

    "kubernetes.io/role/elb" = "1"
  }
}


# AZ-C

resource "aws_subnet" "public_c" {
  vpc_id = aws_vpc.main.id

  cidr_block = "10.0.3.0/24"

  availability_zone = var.az_c

  tags = {
    Name = "${var.project_name}-${var.environment}-public-c"

    "kubernetes.io/role/elb" = "1"
  }
}


# AZ-A

resource "aws_subnet" "private_a" {
  vpc_id = aws_vpc.main.id

  cidr_block = "10.0.11.0/24"

  availability_zone = var.az_a

  tags = {
    Name = "${var.project_name}-${var.environment}-private-a"

    "kubernetes.io/role/internal-elb" = "1"
  }
}


# AZ-B

resource "aws_subnet" "private_b" {
  vpc_id = aws_vpc.main.id

  cidr_block = "10.0.12.0/24"

  availability_zone = var.az_b

  tags = {
    Name = "${var.project_name}-${var.environment}-private-b"

    "kubernetes.io/role/internal-elb" = "1"
  }
}


# AZ-C

resource "aws_subnet" "private_c" {
  vpc_id = aws_vpc.main.id

  cidr_block = "10.0.13.0/24"

  availability_zone = var.az_c

  tags = {
    Name = "${var.project_name}-${var.environment}-private-c"

    "kubernetes.io/role/internal-elb" = "1"
  }
}


resource "aws_eip" "nat_a" {
  domain = "vpc"

  tags = {
    Name = "${var.project_name}-${var.environment}-nat-eip-a"
  }
}


resource "aws_eip" "nat_b" {
  domain = "vpc"

  tags = {
    Name = "${var.project_name}-${var.environment}-nat-eip-b"
  }
}


resource "aws_eip" "nat_c" {
  domain = "vpc"

  tags = {
    Name = "${var.project_name}-${var.environment}-nat-eip-c"
  }
}


resource "aws_nat_gateway" "nat_a" {
  allocation_id = aws_eip.nat_a.id

  subnet_id = aws_subnet.public_a.id

  tags = {
    Name = "${var.project_name}-${var.environment}-nat-a"
  }

  depends_on = [
    aws_internet_gateway.main
  ]
}


resource "aws_nat_gateway" "nat_b" {
  allocation_id = aws_eip.nat_b.id

  subnet_id = aws_subnet.public_b.id

  tags = {
    Name = "${var.project_name}-${var.environment}-nat-b"
  }

  depends_on = [
    aws_internet_gateway.main
  ]
}


resource "aws_nat_gateway" "nat_c" {
  allocation_id = aws_eip.nat_c.id

  subnet_id = aws_subnet.public_c.id

  tags = {
    Name = "${var.project_name}-${var.environment}-nat-c"
  }

  depends_on = [
    aws_internet_gateway.main
  ]
}



resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "${var.project_name}-${var.environment}-public-rt"
  }
}


resource "aws_route" "public_internet" {
  route_table_id = aws_route_table.public.id

  destination_cidr_block = "0.0.0.0/0"

  gateway_id = aws_internet_gateway.main.id
}


# Public subnet associations

resource "aws_route_table_association" "public_a" {
  subnet_id = aws_subnet.public_a.id

  route_table_id = aws_route_table.public.id
}


resource "aws_route_table_association" "public_b" {
  subnet_id = aws_subnet.public_b.id

  route_table_id = aws_route_table.public.id
}


resource "aws_route_table_association" "public_c" {
  subnet_id = aws_subnet.public_c.id

  route_table_id = aws_route_table.public.id
}



# AZ-A

resource "aws_route_table" "private_a" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "${var.project_name}-${var.environment}-private-rt-a"
  }
}


resource "aws_route" "private_a_nat" {
  route_table_id = aws_route_table.private_a.id

  destination_cidr_block = "0.0.0.0/0"

  nat_gateway_id = aws_nat_gateway.nat_a.id
}


resource "aws_route_table_association" "private_a" {
  subnet_id = aws_subnet.private_a.id

  route_table_id = aws_route_table.private_a.id
}


# AZ-B

resource "aws_route_table" "private_b" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "${var.project_name}-${var.environment}-private-rt-b"
  }
}


resource "aws_route" "private_b_nat" {
  route_table_id = aws_route_table.private_b.id

  destination_cidr_block = "0.0.0.0/0"

  nat_gateway_id = aws_nat_gateway.nat_b.id
}


resource "aws_route_table_association" "private_b" {
  subnet_id = aws_subnet.private_b.id

  route_table_id = aws_route_table.private_b.id
}


# AZ-C

resource "aws_route_table" "private_c" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "${var.project_name}-${var.environment}-private-rt-c"
  }
}


resource "aws_route" "private_c_nat" {
  route_table_id = aws_route_table.private_c.id

  destination_cidr_block = "0.0.0.0/0"

  nat_gateway_id = aws_nat_gateway.nat_c.id
}


resource "aws_route_table_association" "private_c" {
  subnet_id = aws_subnet.private_c.id

  route_table_id = aws_route_table.private_c.id
}