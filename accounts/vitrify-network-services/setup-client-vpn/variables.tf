variable "vpn_name" {
  default = "vpn-vitrify"
}

variable "vpn_cidr" {
  default = "10.164.64.0/22"
}

variable "server_cert_arn" {
  default = "arn:aws:acm:us-east-1:543968496399:certificate/db56dc63-42c2-4ba2-b6d1-52f13adb3589"
}

variable "client_cert_arn" {
  default = "arn:aws:acm:us-east-1:543968496399:certificate/6438163f-96fd-4d2a-b022-f141179eebf0"
}

variable "subnet_id" {
  default = "subnet-09b4b3842aeaed5d3"
}

variable "vpc_id" {
  default = "vpc-029554dae89f73e17"
}

variable "internal_routes" {
  type = list(string)
  default = [
    "10.164.0.0/20",
    "10.164.16.0/20",
    "10.164.32.0/20",
    "10.164.48.0/20"
  ]
}
