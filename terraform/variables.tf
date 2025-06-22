variable "yandex_token" {
  type      = string
  sensitive = true
}

variable "cloud_id" {
  type = string
}

variable "folder_id" {
  type = string
}

variable "default_zone" {
  type = string
}
variable "web_zones" {
type    = list(string)
default = ["ru-central1-a", "ru-central1-b"]
}