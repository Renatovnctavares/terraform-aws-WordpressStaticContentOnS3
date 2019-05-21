resource "aws_s3_bucket" "bucket_s3" {
  bucket = "${var.SiteName}"
  acl    = "public-read"
  
  tags = {
    Name = "Website Wordppress on S3"
  }
}

resource "aws_s3_bucket_policy" "buckets3" {
  bucket = "${aws_s3_bucket.bucket_s3.id}"

  policy = <<POLICY
{
        "Version": "2008-10-17",
        "Statement": [
        {
                "Sid": "AllowPublicRead",
                "Effect": "Allow",
                "Principal": {
                        "AWS": "*"
                },
                "Action": "s3:GetObject",
                "Resource": [
                    "${aws_s3_bucket.bucket_s3.arn}/*"
                ]

        }
        ]
}
POLICY
}

