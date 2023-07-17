terraform {
  source = "./config2"
}

inputs = {}

dependency "config1" {
  config_path = "../config1"
}