resource "null_resource" "name" {
  provisioner "local-exec" {
    command = "echo project globs"
  } 
}