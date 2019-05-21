resource "aws_iam_user" "iam_user" {
  name = "${var.SiteName}-Bucket"
  path = "/"
  tags = {
    description = "Wordpress Website access S3"
  }
}

resource "aws_iam_access_key" "iam_user" {
  user    = "${aws_iam_user.iam_user.name}"

}

resource "aws_iam_user_policy" "iam_user" {
  name = "${var.SiteName}"
  user = "${aws_iam_user.iam_user.name}"

  policy = <<EOF
{
        "Version": "2012-10-17",
        "Statement": [
        {
                "Effect": "Allow",
                "Action": [
                        "s3:CreateBucket",
                        "s3:DeleteObject",
                        "s3:Put*",
                        "s3:Get*",
                        "s3:List*"
                ],
                "Resource": [
                        "${aws_s3_bucket.bucket_s3.arn}",
                        "${aws_s3_bucket.bucket_s3.arn}/*"
                ]
        }
        ]
}
EOF
}

