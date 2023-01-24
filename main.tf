resource "google_compute_instance" "vm" {
  name         = var.instance_name
  machine_type = var.machine_type
  zone = var.zone

  boot_disk {
    initialize_params {
      image = var.image
    }
  }
  

    service_account {
    email = google_service_account.sa.email
    scopes = ["https://www.googleapis.com/auth/compute"]
  }


  network_interface {
    network = "default"
  }
}

resource "google_service_account" "sa" {
  account_id   = "iap-sa-01"

}

resource "google_service_account_iam_binding" "admin-account-iam" {
  service_account_id = google_service_account.sa.name
  role               = "roles/iam.serviceAccountUser"

  members = [
    "user:rajoria.anubhav.itguy@gmail.com", "user:Jeetu0509@gmail.com", "user:jyotigrover96@gmail.com", "user:nim.kshitij@gmail.com", "user:mgupta612@gmail.com",
  ]
}

 

resource "google_compute_firewall" "example" {
  name    = var.firewall_name
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["35.235.240.0/20", "130.211.0.0/22"]
}

// ----------------------------------- #SA_IAP-Binding# ----------------------------------------- 

resource "google_project_iam_binding" "iap_binding" {
  project = "annular-orb-372414"
  role = "roles/iap.tunnelResourceAccessor"
  members = [
    "serviceAccount:${google_service_account.sa.email}",
  ]
}

resource "google_project_iam_binding" "os_login_binding" {
  project = "annular-orb-372414"
  role = "roles/compute.osLogin"
  members = [
    "serviceAccount:${google_service_account.sa.email}",
  ]
}
