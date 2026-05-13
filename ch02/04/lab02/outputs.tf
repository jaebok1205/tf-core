output "instance_web1" {
  value = {
    id = aws_instance.web1.id
    public_ip = aws_instance.web1.public_ip
  }
}

output "instance_web2" {
  value = {
    (local.instance2.name) = {
      id = aws_instance.web2.id
      public_ip = aws_instance.web2.public_ip
    }
  }
}

output "sg" {
  value = {
    id = aws_security_group.this.id
    name = aws_security_group.this.name
  }
}

output "iamprofile" {
  value = {
    name = aws_iam_instance_profile.this.name
  }
}

output "iamrole" {
  value = aws_iam_role.this.id
}