#### remote execution

exmple:
```
provisioner "remote-exec" {
    inline = [
         "apt-get -y install wget",
         "wget https://example.com/something"
    ]
}
```
