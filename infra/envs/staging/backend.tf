terraform {
  backend "gcs" {
    bucket = "env_bucket_bt"
    prefix = "staging"
  }
}
