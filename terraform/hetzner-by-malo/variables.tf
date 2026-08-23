variable "hcloud_token" {
  type        = string
  sensitive   = true
  description = "Hetzner Cloud API token"
}

variable "project_name" {
  type        = string
  description = "Name prefix for all resources"
  default     = "vrillees"
}

variable "server_type" {
  type    = string
  default = "cx23" # check "hcloud server-type list" for a list of options
}

variable "server_image" {
  type    = string
  default = "ubuntu-26.04" # check "hcloud image list" for a list of options
}

variable "location" {
  type        = string
  default     = "nbg1" # Nuremberg, Germany
  description = "Hetzner datacenter location"
}

variable "admin_ips" {
  type        = list(string)
  default     = []
  description = "IP ranges allowed to reach SSH (22). Restrict to your own IP or VPN exit IP for best security."
}

variable "ssh_public_key" {
  type        = string
  description = "SSH public key for server access"
}
