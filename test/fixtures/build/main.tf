resource "libvirt_network" "example" {
  name   = "example"
  mode   = "nat"
  domain = "example.net"
  addresses = ["10.99.0.0/16"]
}
