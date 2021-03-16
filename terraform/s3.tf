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

  key    = "hosts"

  acl    = "private"

  source = "hosts"

  depends_on = [
    local_file.tf_host_ansible,
  ]

}