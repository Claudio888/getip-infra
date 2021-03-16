resource "local_file" "tf_host_ansible" {
  content = <<-DOC
    [Instance]
    ${aws_eip.ip.public_ip} ansible_user=root
    DOC
  filename = "hosts"
}