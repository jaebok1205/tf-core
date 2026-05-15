output "vpc" {
  value = {
    id = aws_vpc.this.id
  }
}

output "subnet" {
  value = {
    (local.public_subnet[0].name) = {
      id = aws_subnet.public_0.id
    },
    (local.public_subnet[1].name) = {
      id = aws_subnet.public_1.id
    }
  }
}