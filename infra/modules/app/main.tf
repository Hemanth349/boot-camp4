provider "google" {
  project = var.project_id
  region  = var.region
}

resource "google_cloud_run_service" "app" {
  name     = "flask-${var.env}"
  location = var.region

  template {
    spec {
      containers {
        image = var.image_url
      }
    }
  }

  traffics {
    percent         = 100
    latest_revision = true
  }
}

resource "google_cloud_deploy_target" "target" {
  name      = var.env
  location  = var.region
  target_id = var.env

  run {
    location = google_cloud_run_service.app.location
    service  = google_cloud_run_service.app.name
  }
}
