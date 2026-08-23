resource "hcloud_firewall" "server_firewall" {
  name = "${var.project_name}-firewall"

  # ssh
  rule {
    direction  = "in"
    protocol   = "tcp"
    port       = "22"
    source_ips = var.admin_ips
  }

  # icmp
  rule {
    direction  = "in"
    protocol   = "icmp"
    source_ips = var.admin_ips
  }

  # http
  rule {
    direction  = "in"
    protocol   = "tcp"
    port       = "80"
    source_ips = ["0.0.0.0/0"]
  }

  # https
  rule {
    direction  = "in"
    protocol   = "tcp"
    port       = "443"
    source_ips = ["0.0.0.0/0"]
  }
}
