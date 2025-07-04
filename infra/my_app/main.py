provider "google" {
  project = var.project_id
  region  = var.region
}

resource "google_cloud_run_service" "dev" {
  name     = "flask-dev"
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

resource "google_cloud_deploy_target" "dev" {
  name     = "dev"
  location = var.region
  target_id = "dev"

  run {
    location = google_cloud_run_service.dev.location
    service  = google_cloud_run_service.dev.name
  }
}
```
