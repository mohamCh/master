resource "aws_subnet" "my_subnet1" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = var.subnet_cidr_block[0]
  availability_zone       = data.aws_availability_zones.available.names[13]
  map_public_ip_on_launch = true

  tags = {
    Name = "SubnetMchalhi1"
  }
}

resource "aws_subnet" "my_subnet2" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = var.subnet_cidr_block[1]
  availability_zone       = data.aws_availability_zones.available.names[14]
  map_public_ip_on_launch = true

  tags = {
    Name = "SubnetMchalhi2"
  }
}

resource "aws_subnet" "my_subnet3" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = var.subnet_cidr_block[2]
  availability_zone       = data.aws_availability_zones.available.names[15]
  map_public_ip_on_launch = true

  tags = {
    Name = "SubnetMchalhi3"
  }
}
