resource "null_resource" "name" {
  provisioner "local-exec" {
    command = "echo project globs"
  } 
}

resource "null_resource" "name2" {
  provisioner "local-exec" {
    command = "echo project globs"
  } 
}

resource "null_resource" "name3" {
  provisioner "local-exec" {
    command = "echo project globs"
  } 
}