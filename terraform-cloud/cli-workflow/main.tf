terraform {
  cloud {
    organization = "saturnhead"

    workspaces {
      name = "random_pet"
    }
  }
}

resource "random_pet" "this" {
  length    = 2
  separator = "-"
}
