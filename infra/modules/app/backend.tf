terraform {
  backend "gcs" {
    bucket = "your-terraform-state-bucket"
    prefix = "flask-ci-cd"
  }
}
