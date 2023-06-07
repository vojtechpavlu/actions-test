resource "local_file" "prod_file" {
  filename = "${path.module}/prod_file.txt"
  content  = "This is my prod file."
}