provider "google" {
  project = "project-2-458822"
  region  = "us-central1"
}

module "app" {
  source      = "../../modules/app"
  name        = "staging-app"
  image       = "gcr.io/project-2-458822/staging-image"
  region      = "us-central1"
  environment = "staging"
}



