resource "aws_eip" "lb" {
#   instance = aws_instance.web.id
  vpc      = true
}

resource "aws_s3_bucket" "my-bucket" {
    bucket = "my-sanjit-bucket"
}