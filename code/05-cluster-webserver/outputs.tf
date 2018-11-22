# Output variable: Public IP address
output "public_ip" {
  value = "${google_compute_address.example.address}"
}
