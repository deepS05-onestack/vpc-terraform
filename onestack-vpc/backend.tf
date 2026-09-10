terraform {
  required_version = ">= 1.0"

  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "onestack"

    workspaces {
      name = "onestack-vpc"
    }
  }
}
