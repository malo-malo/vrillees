terraform {
  required_version = ">= 1.0"

  required_providers {
    hcloud = {
      source  = "hetznercloud/hcloud"
      version = "~> 1.45"
    }
  }
}

provider "hcloud" {
  token = var.hcloud_token
}

resource "hcloud_server" "webapp" {
  name        = "${var.project_name}-webapp"
  server_type = var.server_type
  image       = var.server_image
}
