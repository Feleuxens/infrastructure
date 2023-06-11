variable "email" {
    description = "Email address for notifications from LetsEncrypt"
    type = string
    default = "sslcerts@feleuxens.de"
}

variable "cf-email" {
    description = "Email address of cloudflare account"
    type = string
}

variable "cf-api-key" {
    description = "Cloudflare API Key"
    type = string
    default = ""
}