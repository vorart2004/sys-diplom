terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"
}

provider "yandex" {
  zone = var.default_zone
}





# 1. Bastion Host
resource "yandex_compute_instance" "bastion" {
  name        = "bastion"
  zone        = var.default_zone
  platform_id = "standard-v1"

  resources {
    cores         = 2
    core_fraction = 20
    memory        = 2
  }
  scheduling_policy { preemptible = true }

  network_interface {
    subnet_id = yandex_vpc_subnet.public.id
    nat       = true
  }

  boot_disk {
    initialize_params {
      image_id = "fd8fmmpanqj0dun552e9"
      type     = "network-hdd"
      size     = 10
    }
  }

  metadata = {
    ssh-keys = "artvoadm2:${file("~/.ssh/id_rsa.pub")}"
  }
}

# 2. Веб-сервера
resource "yandex_compute_instance" "web1" {
  name        = "web-1"
  zone        = var.default_zone
  platform_id = "standard-v1"

  resources {
    cores         = 2
    core_fraction = 20
    memory        = 2
  }
  scheduling_policy { preemptible = true }

  network_interface {
    subnet_id = yandex_vpc_subnet.private1.id
    nat       = false
  }
  
  

  boot_disk {
    initialize_params {
      image_id = "fd8fmmpanqj0dun552e9"
      type     = "network-hdd"
      size     = 10
    }
  }

  metadata = {
    ssh-keys = "artvoadm2:${file("~/.ssh/id_rsa.pub")}"
  }
}
resource "yandex_compute_instance" "web2" {
  name        = "web-2"
  zone        = "ru-central1-b"
  platform_id = "standard-v1"

  resources {
    cores         = 2
    core_fraction = 20
    memory        = 2
  }
  scheduling_policy { preemptible = true }

  network_interface {
    subnet_id = yandex_vpc_subnet.private2.id
    nat       = false
  }
  
  

  boot_disk {
    initialize_params {
      image_id = "fd8fmmpanqj0dun552e9"
      type     = "network-hdd"
      size     = 10
    }
  }

  metadata = {
    ssh-keys = "artvoadm2:${file("~/.ssh/id_rsa.pub")}"
  }
}

# 3. Zabbix Server
resource "yandex_compute_instance" "zabbix" {
  name        = "zabbix"
  zone        = var.default_zone
  platform_id = "standard-v1"

  resources {
    cores         = 2
    core_fraction = 20
    memory        = 2
  }
  scheduling_policy { preemptible = true }

  network_interface {
    subnet_id = yandex_vpc_subnet.public.id
    nat       = true
  }

  boot_disk {
    initialize_params {
      image_id = "fd8fmmpanqj0dun552e9"
      type     = "network-hdd"
      size     = 10
    }
  }

  metadata = {
    ssh-keys = "artvoadm2:${file("~/.ssh/id_rsa.pub")}"
  }
}

# 4. Kibana
resource "yandex_compute_instance" "kibana" {
  name        = "kibana"
  zone        = var.default_zone
  platform_id = "standard-v1"

  resources {
    cores         = 2
    core_fraction = 20
    memory        = 2
  }
  scheduling_policy { preemptible = true }

  network_interface {
    subnet_id = yandex_vpc_subnet.public.id
    nat       = true
  }

  boot_disk {
    initialize_params {
      image_id = "fd8fmmpanqj0dun552e9"
      type     = "network-hdd"
      size     = 10
    }
  }

  metadata = {
    ssh-keys = "artvoadm2:${file("~/.ssh/id_rsa.pub")}"
  }
}

# 5. Elasticsearch
resource "yandex_compute_instance" "es" {
  name        = "es"
  zone        = var.default_zone
  platform_id = "standard-v1"

  resources {
    cores         = 2
    core_fraction = 20
    memory        = 2
  }
  scheduling_policy { preemptible = false }

  network_interface {
    subnet_id = yandex_vpc_subnet.private1.id
    nat       = false
  }

  boot_disk {
    initialize_params {
      image_id = "fd8fmmpanqj0dun552e9"
      type     = "network-hdd"
      size     = 10
    }
  }

  metadata = {
    ssh-keys = "artvoadm2:${file("~/.ssh/id_rsa.pub")}"
  }
}