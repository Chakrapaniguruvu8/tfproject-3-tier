#NatGW
resource "aws_nat_gateway" "swiggy-natgw-01" {
  allocation_id = aws_eip.swiggy-nat-eip.id
  subnet_id     = aws_subnet.swiggy23-pub-sub-1.id

  tags = {
    Name = "swiggy-natgwchakri-1"
  }
  depends_on = [aws_internet_gateway.swiggy-igw]
}


