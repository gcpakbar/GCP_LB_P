provider "google" {
  project = "theta-solution-477214-p8"
  region  = "us-central1"
  zone    = "us-central1-c"
}

resource "google_compute_instance" "vm_instance" {
  name         = "gcp-cloud-vm-instance"
  machine_type = "e2-micro"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    # A default network is created for all GCP projects
    network = "default"
    access_config {
    }
  }
}

# Create new storage bucket in the US
# location with Standard Storage

resource "google_storage_bucket" "static" {
 name          = "gcp-cloud-bucket-lb"
 location      = "US"
 storage_class = "STANDARD"

 uniform_bucket_level_access = true
}