provider "digitalocean" {}

resource "digitalocean_droplet" "k8s-control" {
  count  = 1

  image  = "32069121"
  name   = "k8s-control"
  region = "nyc1"
  size   = "512mb"

  ssh_keys = [ "89:e3:7d:ac:ec:ca:2b:b6:d9:cc:4f:1c:32:c1:1a:6e" ]
}

output "control_ip" {
  value = "${digitalocean_droplet.k8s-control.*.ipv4_address}"
}
