output "public_subnet_ids" {
  value = aws_subnet.pub_subnet[*].id
}
