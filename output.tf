output "AWS_BUCKET_URL" {
 value = "${aws_s3_bucket.bucket_s3.bucket}.s3-${aws_s3_bucket.bucket_s3.region}.amazonaws.com"
}


output "ID_USER" {
  value = "${aws_iam_access_key.iam_user.id}"
}


output "ID_SECRET" {
  value = "${aws_iam_access_key.iam_user.secret}"
}

