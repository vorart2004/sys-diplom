resource "yandex_vpc_network" "main" {
  name = "main-net"
}
resource "yandex_vpc_subnet" "public" {
  name           = "public-subnet"
  zone           = var.default_zone
  network_id     = yandex_vpc_network.main.id
  v4_cidr_blocks = ["10.0.1.0/24"]
}
resource "yandex_vpc_subnet" "private1" {
  name           = "private-subnet1"
  zone           = var.default_zone
  network_id     = yandex_vpc_network.main.id
  v4_cidr_blocks = ["10.0.5.0/24"]
}
resource "yandex_vpc_subnet" "private2" {
  name           = "private-subnet2"
  zone           = "ru-central1-b"
  network_id     = yandex_vpc_network.main.id
  v4_cidr_blocks = ["10.0.3.0/24"]
}
resource "yandex_vpc_gateway" "nat" {
  name      = "nat-gateway"
  folder_id = var.folder_id
  shared_egress_gateway {}
}
