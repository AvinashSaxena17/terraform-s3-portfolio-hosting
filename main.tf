# Create an S3 bucket
resource "aws_s3_bucket" "my_bucket" {
  bucket = var.bucketname
}

resource "aws_s3_bucket_ownership_controls" "my_bucket_ownership" {
  bucket = aws_s3_bucket.my_bucket.id

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_public_access_block" "my_bucket_ownership_public_access" {
  bucket = aws_s3_bucket.my_bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_acl" "my_bucket_acl" {
  depends_on = [
    aws_s3_bucket_ownership_controls.my_bucket_ownership,
    aws_s3_bucket_public_access_block.my_bucket_ownership_public_access,
  ]

  bucket = aws_s3_bucket.my_bucket.id
   acl    = "public-read"
 
}

# Upload index.html
resource "aws_s3_object" "index" {
  bucket       = aws_s3_bucket.my_bucket.id
  key          = "index.html"
  source       = "index.html"

  content_type = "text/html"
}

# Upload error.html
resource "aws_s3_object" "error" {
  bucket       = aws_s3_bucket.my_bucket.id
  key          = "error.html"
  source       = "error.html"

  content_type = "text/html"
}

# Local variables to grab all relevant files
locals {
  # Get all CSS files in the assets/css directory
  css_files = fileset("assets/css", "**/*.css")

  # Get all JS files in the assets/js directory
  js_files = fileset("assets/js", "**/*.js")

  # Get all image files in the assets/images directory
  image_files = fileset("assets/images", "**/*.*")
}

# Upload all CSS files
resource "aws_s3_object" "css_files" {
  for_each = toset(local.css_files)

  bucket       = aws_s3_bucket.my_bucket.id
  key          = "assets/css/${each.value}"
  source       = "assets/css/${each.value}"
 
  content_type = "text/css"
}

# Upload all JS files
resource "aws_s3_object" "js_files" {
  for_each = toset(local.js_files)

  bucket       = aws_s3_bucket.my_bucket.id
  key          = "assets/js/${each.value}"
  source       = "assets/js/${each.value}"
  
  content_type = "application/javascript"
}

# Upload all image files
resource "aws_s3_object" "image_files" {
  for_each = toset(local.image_files)

  bucket       = aws_s3_bucket.my_bucket.id
  key          = "assets/images/${each.value}"
  source       = "assets/images/${each.value}"
 
  content_type = "image/${split(".", each.value)[length(split(".", each.value)) - 1]}"
}

# Website configuration for the bucket
resource "aws_s3_bucket_website_configuration" "aws_s3_object_config" {
  bucket = aws_s3_bucket.my_bucket.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}

resource "aws_s3_bucket_policy" "public_read" {
  bucket = aws_s3_bucket.my_bucket.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "PublicReadGetObject"
        Effect    = "Allow"
        Principal = "*"
        Action    = "s3:GetObject"
        Resource  = "${aws_s3_bucket.my_bucket.arn}/*"
      }
    ]
  })
}
