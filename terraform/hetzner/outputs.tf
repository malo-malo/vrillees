output "server_public_ip" {
  description = "Public IPv4 address of the server node"
  value       = hcloud_server.server.ipv4_address
}

output "server_private_ip" {
  description = "Private IP address of the server node"
  value       = local.server_private_ip
}

output "jobrunner_public_ip" {
  description = "Public IPv4 address of the jobrunner node (null if not provisioned)"
  value       = var.create_jobrunner ? hcloud_server.jobrunner[0].ipv4_address : null
}

output "jobrunner_private_ip" {
  description = "Private IP address of the jobrunner node (null if not provisioned)"
  value       = var.create_jobrunner ? local.jobrunner_private_ip : null
}

output "webapp_public_ips" {
  description = "Public IPv4 addresses of webapp nodes"
  value       = hcloud_server.webapp[*].ipv4_address
}

output "webapp_private_ips" {
  description = "Private IP addresses of webapp nodes"
  value       = local.webapp_private_ips
}

output "network_id" {
  description = "ID of the private network"
  value       = hcloud_network.private_network.id
}

output "get_kubeconfig_cmd" {
  description = "Command to fetch kubeconfig from the server"
  value       = "ssh ubuntu@${hcloud_server.server.ipv4_address} 'cat /home/ubuntu/.kube/config' | sed 's/127.0.0.1/${hcloud_server.server.ipv4_address}/g' > ~/.kube/vrillees.yaml"
}
