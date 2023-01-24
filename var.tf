variable "instance_name" {
    description = "vm name"
}
variable "machine_type" {
    default = "e2-micro"
}
variable "zone" {
    default = "us-central1-a"
}
variable "image" {
    default = "debian-cloud/debian-10"
}
variable "firewall_name" {
    default = "fw-new-iap"
}