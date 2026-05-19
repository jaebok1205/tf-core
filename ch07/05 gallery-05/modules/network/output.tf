output "vpc" {
  value = {
    (local.vpc.name) = {
      id = aws_vpc.this.id
    }
  }
}

output "subnet" {
  value = {
    (local.public_subnet[0].name) = {
      id = aws_subnet.public_0.id
      cidr_block = aws_subnet.public_0.cidr_block
    }

    (local.public_subnet[1].name) = {
      id = aws_subnet.public_1.id
      cidr_block = aws_subnet.public_1.cidr_block
    }

    (local.private_subnet[0].name) = {
      id = aws_subnet.private_0.id
      cidr_block = aws_subnet.private_0.cidr_block
    }

    (local.private_subnet[1].name) = {
      id = aws_subnet.private_1.id
      cidr_block = aws_subnet.private_1.cidr_block
    }
  }
}