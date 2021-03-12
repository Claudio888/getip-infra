resource "aws_s3_bucket" "buckets3" {

  bucket = format("getip-hosts-%s",var.env_prefix)

  acl    = "private"

  tags = {

    Name        = "getip hosts file"

    Environment = var.env_prefix

  }

}

resource "aws_s3_bucket_object" "upload_object" {

  bucket = aws_s3_bucket.buckets3.id

  key    = "profile"

  acl    = "private"

  source = "${path.module}/hosts"

  etag = filemd5("hosts")

}