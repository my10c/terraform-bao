#### remote execution

Execute a command with Terraform

exmple:
```
provisioner "remote-exec" {
    inline = [
         "apt-get -y install wget",
         "wget https://example.com/something"
    ]
}
```
