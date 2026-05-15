#network module
#public-a
resource "aws_subnet" "public_0" {
  vpc_id = aws_vpc.this.id
  cidr_block = local.public_subnet[0].cidr_block
  availability_zone = local.public_subnet[0].availability_zone
  map_public_ip_on_launch = local.public_subnet[0].map_public_ip_on_launch

  tags = {
    Name = "${local.namespace}-subnet-${local.public_subnet[0].name}"
  }
}

resource "aws_route_table" "public_0" {
  vpc_id = aws_vpc.this.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.this.id
  }

  tags = {
    Name = "${local.namespace}-rtb-${local.public_subnet[0].name}"
  }
}

resource "aws_route_table_association" "public_0" {
  subnet_id = aws_subnet.public_0.id
  route_table_id = aws_route_table.public_0.id
}

#public-b
resource "aws_subnet" "public_1" {
  vpc_id = aws_vpc.this.id
  cidr_block = local.public_subnet[1].cidr_block
  availability_zone = local.public_subnet[1].availability_zone
  map_public_ip_on_launch = local.public_subnet[1].map_public_ip_on_launch

  tags = {
    Name = "${local.namespace}-subnet-${local.public_subnet[1].name}"
  }
}

resource "aws_route_table" "public_1" {
  vpc_id = aws_vpc.this.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.this.id
  }

  tags = {
    Name = "${local.namespace}-rtb-${local.public_subnet[1].name}"
  }
}

resource "aws_route_table_association" "public_1" {
  subnet_id = aws_subnet.public_1.id
  route_table_id = aws_route_table.public_1.id
}



#private-c
resource "aws_subnet" "private_0" {
  vpc_id = aws_vpc.this.id
  cidr_block = local.private_subnet[0].cidr_block
  availability_zone = local.private_subnet[0].availability_zone
  map_public_ip_on_launch = local.private_subnet[0].map_public_ip_on_launch

  tags = {
    Name = "${local.namespace}-subnet-${local.private_subnet[0].name}"
  }
}

resource "aws_route_table" "private_0" {
  vpc_id = aws_vpc.this.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.this.id
  }

  tags = {
    Name = "${local.namespace}-rtb-${local.private_subnet[0].name}"
  }
}

resource "aws_route_table_association" "private_0" {
  subnet_id = aws_subnet.private_0.id
  route_table_id = aws_route_table.private_0.id
}

#private-d
resource "aws_subnet" "private_1" {
  vpc_id = aws_vpc.this.id
  cidr_block = local.private_subnet[1].cidr_block
  availability_zone = local.private_subnet[1].availability_zone
  map_public_ip_on_launch = local.private_subnet[1].map_public_ip_on_launch

  tags = {
    Name = "${local.namespace}-subnet-${local.private_subnet[1].name}"
  }
}

resource "aws_route_table" "private_1" {
  vpc_id = aws_vpc.this.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.this.id
  }

  tags = {
    Name = "${local.namespace}-rtb-${local.private_subnet[1].name}"
  }
}

resource "aws_route_table_association" "private_1" {
  subnet_id = aws_subnet.private_1.id
  route_table_id = aws_route_table.private_1.id
}
/*

*/