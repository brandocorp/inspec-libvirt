resource "libvirt_domain" "testdomain" {
  name   = "testdomain"
  vcpu   = 1
  memory = 512

  network_interface {
    network_id     = "410cdcaa-e202-4fe2-b574-0cecf103f5d3"
    wait_for_lease = true
  }
}
