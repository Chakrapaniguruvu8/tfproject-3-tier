# Internet Gateway
resource "aws_internet_gateway" "swiggy-igw33" {
  tags = {
    Name = "swiggy-igw33"
  }
  vpc_id = aws_vpc.swiggy23-vpc.id
}

