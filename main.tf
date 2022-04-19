terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
    }
  }
}

provider "digitalocean" {
  token = var.do_token
}


resource "digitalocean_droplet" "rancher-master" {
  image  = "ubuntu-20-04-x64"
  name   = "rancher-master"
  region = "nyc1"
  size   = "s-2vcpu-4gb"
  # private_networking = true 
  ssh_keys = [
    var.pvt_key
  ]

  # connection {
  #   host = self.ipv4_address
  #   user = "root"
  #   type = "ssh"
  #   private_key = file(var.pvt_key)
  #   timeout = "2m"
  # }

  connection {
   host        = self.ipv4_address 
   agent       = true
   type        = "ssh"
   user        = "root"
   private_key = file(pathexpand("~/.ssh/id_rsa"))
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt update", 
      "sudo apt install python3 -y",
      "echo Done ACABOU!"]

    connection {
      host        = self.ipv4_address
      type        = "ssh"
      user        = "root"
      private_key = file(pathexpand("~/.ssh/id_rsa"))
    }
  }

  provisioner "local-exec" {
    command = "ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -u root -i '${self.ipv4_address},' --private-key ${var.pvt_key} -e 'pub_key=${var.pub_key}' rancher-master.yaml"
  }
}

resource "digitalocean_droplet" "k8s-1" {
  image  = "ubuntu-20-04-x64"
  name   = "k8s-1"
  region = "nyc1"
  size   = "s-2vcpu-4gb"
  # private_networking = true 
  ssh_keys = [
    var.pvt_key
  ]

  # connection {
  #   host = self.ipv4_address
  #   user = "root"
  #   type = "ssh"
  #   private_key = file(var.pvt_key)
  #   timeout = "2m"
  # }

  connection {
   host        = self.ipv4_address 
   agent       = true
   type        = "ssh"
   user        = "root"
   private_key = file(pathexpand("~/.ssh/id_rsa"))
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt update", 
      "sudo apt install python3 -y",
      "echo Done ACABOU!"]

    connection {
      host        = self.ipv4_address
      type        = "ssh"
      user        = "root"
      private_key = file(pathexpand("~/.ssh/id_rsa"))
    }
  }

  provisioner "local-exec" {
    command = "ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -u root -i '${self.ipv4_address},' --private-key ${var.pvt_key} -e 'pub_key=${var.pub_key}' k8s-nos.yaml"
  }
}


resource "digitalocean_droplet" "k8s-2" {
  image  = "ubuntu-20-04-x64"
  name   = "k8s-2"
  region = "nyc1"
  size   = "s-2vcpu-4gb"
  # private_networking = true 
  ssh_keys = [
    var.pvt_key
  ]

  # connection {
  #   host = self.ipv4_address
  #   user = "root"
  #   type = "ssh"
  #   private_key = file(var.pvt_key)
  #   timeout = "2m"
  # }

  connection {
   host        = self.ipv4_address 
   agent       = true
   type        = "ssh"
   user        = "root"
   private_key = file(pathexpand("~/.ssh/id_rsa"))
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt update", 
      "sudo apt install python3 -y",
      "echo Done ACABOU!"]

    connection {
      host        = self.ipv4_address
      type        = "ssh"
      user        = "root"
      private_key = file(pathexpand("~/.ssh/id_rsa"))
    }
  }

  provisioner "local-exec" {
    command = "ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -u root -i '${self.ipv4_address},' --private-key ${var.pvt_key} -e 'pub_key=${var.pub_key}' k8s-nos.yaml"
  }
}

resource "digitalocean_droplet" "k8s-3" {
  image  = "ubuntu-20-04-x64"
  name   = "k8s-3"
  region = "nyc1"
  size   = "s-2vcpu-4gb"
  # private_networking = true 
  ssh_keys = [
    var.pvt_key
  ]

  # connection {
  #   host = self.ipv4_address
  #   user = "root"
  #   type = "ssh"
  #   private_key = file(var.pvt_key)
  #   timeout = "2m"
  # }

  connection {
   host        = self.ipv4_address 
   agent       = true
   type        = "ssh"
   user        = "root"
   private_key = file(pathexpand("~/.ssh/id_rsa"))
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt update", 
      "sudo apt install python3 -y",
      "echo Done ACABOU!"]

    connection {
      host        = self.ipv4_address
      type        = "ssh"
      user        = "root"
      private_key = file(pathexpand("~/.ssh/id_rsa"))
    }
  }

  provisioner "local-exec" {
    command = "ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -u root -i '${self.ipv4_address},' --private-key ${var.pvt_key} -e 'pub_key=${var.pub_key}' k8s-nos.yaml"
  }
}

# resource "digitalocean_droplet" "rancher-k8s-1" {
#   image  = "ubuntu-20-04-x64"
#   name   = "rancher-k8s-1"
#   region = "nyc1"
#   size   = "s-2vcpu-4gb"
#   # private_networking = true 
#   ssh_keys = [
#     var.pvt_key
#   ]

#   connection {
#     host = self.ipv4_address
#     user = "root"
#     type = "ssh"
#     private_key = file(var.pvt_key)
#     timeout = "2m"
#   }
# }

# resource "digitalocean_droplet" "rancher-k8s-2" {
#   image  = "ubuntu-20-04-x64"
#   name   = "rancher-k8s-2"
#   region = "nyc1"
#   size   = "s-2vcpu-4gb"
#   # private_networking = true 
#   ssh_keys = [
#     var.pvt_key
#   ]

#   connection {
#     host = self.ipv4_address
#     user = "root"
#     type = "ssh"
#     private_key = file(var.pvt_key)
#     timeout = "2m"
#   }
# }

# resource "digitalocean_droplet" "rancher-k8s-3" {
#   image  = "ubuntu-20-04-x64"
#   name   = "rancher-k8s-3"
#   region = "nyc1"
#   size   = "s-2vcpu-4gb"
#   # private_networking = true 
#   ssh_keys = [
#     var.pvt_key
#   ]

#   connection {
#     host = self.ipv4_address
#     user = "root"
#     type = "ssh"
#     private_key = file(var.pvt_key)
#     timeout = "2m"
#   }
# }

# resource "digitalocean_project_resources" "rancher" {
#   project = var.project_id
#   resources = [ 
#     resource.digitalocean_droplet.rancher-master.urn,
#     resource.digitalocean_droplet.rancher-k8s-1.urn, 
#     resource.digitalocean_droplet.rancher-k8s-2.urn, 
#     resource.digitalocean_droplet.rancher-k8s-3.urn, 
#    ]
# }

output "droplet_ip_address" {
  value = [
    digitalocean_droplet.rancher-master.ipv4_address,
    digitalocean_droplet.k8s-1.ipv4_address,
    digitalocean_droplet.k8s-2.ipv4_address,
    digitalocean_droplet.k8s-3.ipv4_address,
  ]
}

