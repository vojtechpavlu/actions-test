resource "local_file" "dev_file" {
  filename = "${path.module}/dev_file.txt"
  content  = "This is my dev file."
}