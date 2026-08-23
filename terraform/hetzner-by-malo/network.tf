resource "hcloud_primary_ip" "server_ipv6" {
  name        = "${var.project_name}-ipv6"
  type        = "ipv6"
  location    = var.location
  auto_delete = false
}
