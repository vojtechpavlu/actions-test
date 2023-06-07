resource "local_file" "test_file" {
  filename = "${path.module}/test_file.txt"
  content  = "This is my test file."
}