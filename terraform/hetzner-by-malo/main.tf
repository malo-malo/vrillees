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
  location    = var.location

  ssh_keys     = [hcloud_ssh_key.default.id]
  firewall_ids = [hcloud_firewall.server_firewall.id]

  public_net {
    ipv4_enabled = false
    ipv6_enabled = true
    ipv6         = hcloud_primary_ip.server_ipv6.id
  }

  user_data = templatefile("${path.module}/cloud-init.yml", {
    hostname       = "${var.project_name}-webapp"
    ssh_public_key = var.ssh_public_key
  })

  labels = {
    project = var.project_name
    role    = "webapp"
  }
}

# SSH key for server access
resource "hcloud_ssh_key" "default" {
  name       = "${var.project_name}-key"
  public_key = var.ssh_public_key
}
