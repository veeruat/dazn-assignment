resource "aws_key_pair" "ec2_kp" {
  key_name   = var.ec2_key_name
  public_key = file(var.public_key_path)
}
