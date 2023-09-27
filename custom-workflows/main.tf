terraform {
  required_providers {
    random = {
      source = "registry.opentofu.org/hashicorp/random"
    }
  }
}

resource "random_pet" "pet" {
  length = 3
}