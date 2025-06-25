resource "google_cloud_run_service" "default" {
  name     = var.name
  location = var.region

  template {
    spec {
      containers {
        image = var.image
        env {
          name  = "ENV"
          value = var.environment
        }
      }
    }
  }

  traffic {
    percent         = 100
    latest_revision = true
  }
}

resource "google_cloud_run_service_iam_member" "invoker" {
  service  = google_cloud_run_service.default.name
  location = var.region
  role     = "roles/run.invoker"
  member   = "allUsers"
}
