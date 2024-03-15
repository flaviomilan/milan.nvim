resource "null_resource" "hello" {
  provisioner "local-exec" {
    command = "echo 'Hello, world from complex Terraform!'"
  }
}

