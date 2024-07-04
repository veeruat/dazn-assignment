resource "aws_subnet" "pub_subnet" {
  count             = length(var.public_subnets)
  vpc_id            = var.vpc_id
  cidr_block        = element(var.public_subnets, count.index)
  availability_zone = element(var.availability_zones, count.index)

  tags = {
    Name = "${var.prefix}-public-subnet-${count.index}"
  }
}
