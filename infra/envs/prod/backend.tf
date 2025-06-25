terraform {
  backend "gcs" {
    bucket = "prod_bucket_bt"
    prefix = "prod"
  }
}

