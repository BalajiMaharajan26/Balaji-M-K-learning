resource "aws_vpc" "myvpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = {
    Name = "myvpc"
  }
}

resource "aws_subnet" "subneta" {
  vpc_id                  = aws_vpc.myvpc.id
  availability_zone       = "ap-south-1a"  # Adjust to your region
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true  # For public subnet
  tags = {
    Name = "subnetterraform"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.myvpc.id
  tags = {
    Name = "myigw"
  }
}

resource "aws_egress_only_internet_gateway" "gw" {
  vpc_id = aws_vpc.myvpc.id
  tags = {
    Name = "my-egress-only-gw"
  }
}

# Public Route Table (for internet access)
resource "aws_route_table" "myroutetable" {
  vpc_id = aws_vpc.myvpc.id
  
  # Route for IPv4 internet traffic
  route {
    cidr_block = "0.0.0.0/0"  # All IPv4 internet traffic
    gateway_id = aws_internet_gateway.gw.id
  }
  
  # Route for IPv6 internet traffic (egress only)
  route {
    ipv6_cidr_block        = "::/0"  # All IPv6 internet traffic
    egress_only_gateway_id = aws_egress_only_internet_gateway.gw.id
  }
  
  tags = {
    Name = "myRoutetable"
  }
}

resource "aws_route_table_association" "myassociation" {
  subnet_id      = aws_subnet.subneta.id
  route_table_id = aws_route_table.myroutetable.id
}
