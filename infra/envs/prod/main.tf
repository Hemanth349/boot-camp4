provider "google" {
  project = "project-2-458822"
  region  = "us-central1"
}

module "app" {
  source      = "../../modules/app"
  name        = "prod-app"
  image       = "gcr.io/project-2-458822/prod-image"
  region      = "us-central1"
  environment = "prod"
}
