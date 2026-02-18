variable "cloudflare_account_id" {
  type      = string
  sensitive = true
}

variable "cloudflare_token" {
  type      = string
  sensitive = true
}

variable "my_ip" {
  type        = string
}

variable "domain_name" {
  default = "robertdomenkek.pp.ua"
}
