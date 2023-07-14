resource "terraform_data" "this" {
  count = 50
  provisioner "local-exec" {
    command = format("echo %d", count.index)
  }
}