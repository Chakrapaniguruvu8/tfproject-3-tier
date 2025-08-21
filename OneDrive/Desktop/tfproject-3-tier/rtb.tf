# Create a Route Table
resource "aws_route_table" "swiggy-web-rt" {
  vpc_id = aws_vpc.swiggy22-vpc.id
  tags = {
    Name = "swiggy-web-rtch"
  }
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gatewaych.swiggy-igwre.id
  }
}

resource "aws_route_table" "swiggy-app-rt" {
  vpc_id = aws_vpc.swiggy-vpcreer.id
  tags = {
    Name = "swiggy-app-rtchakri"
  }
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.chswiggy-natgw-01.id
  }
}

# Route Table Association
resource "aws_route_table_association" "swiggy-rt-as-1" {
  subnet_id      = aws_subnet.chswiggy-pub-sub-1.id
  route_table_id = aws_route_table.swiggy21-web-rt.id
}

resource "aws_route_table_association" "swiggy-rt-as-2" {
  subnet_id      = aws_subnet.chswiggy-pub-sub-2.id
  route_table_id = aws_route_table.swiggy12-web-rt.id
}

resource "aws_route_table_association" "swiggy-rt-as-3" {
  subnet_id      = aws_subnet.chswiggy-pvt-sub-1.id
  route_table_id = aws_route_table.swiggy12-app-rt.id
}
resource "aws_route_table_association" "swiggy-rt-as-4" {
  subnet_id      = aws_subnet.chswiggy-pvt-sub-2.id
  route_table_id = aws_route_table.swiggy45-app-rt.id
}

resource "aws_route_table_association" "swiggy-rt-as-5" {
  subnet_id      = aws_subnet.chswiggy-pvt-sub-3.id
  route_table_id = aws_route_table.swiggy32-app-rt.id
}
resource "aws_route_table_association" "swiggy-rt-as-6" {
  subnet_id      = aws_subnet.swiggy-pvt-subre-4.id
  route_table_id = aws_route_table.chswiggy-app-rt.id
}

# Create an Elastic IP address for the NAT Gateway
resource "aws_eip" "swiggy-nat-eip" {
  domain = "vpc"
  tags = {
    Name = "swiggy-nat-eipchakri"
  }
}

