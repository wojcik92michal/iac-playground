terraform {
  required_providers {
    cloudsigma = {
      source = "cloudsigma/cloudsigma"
    }
  }
}


locals {
  os_system_uuid = "c62fe993-de0a-4a08-9858-21352eab7df2" # Ubuntu 21.04 LTS
}

resource "cloudsigma_drive" "drive" {
  media          = "disk"
  name           = var.name
  size           = var.storage_size_in_bytes
  clone_drive_id = local.os_system_uuid
}

resource "cloudsigma_server" "server" {
  cpu          = var.cpu_in_MHz
  memory       = var.memory_in_bytes
  name         = var.name
  vnc_password = var.vnc_password

  network {
    type = "dhcp"
  }

  drive {
    uuid = cloudsigma_drive.drive.id
  }
}
