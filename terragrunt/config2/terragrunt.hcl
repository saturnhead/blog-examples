terraform {
  source = "./"
}

inputs = {}

dependency "config1" {
  config_path  = "../config1"
  skip_outputs = true
}