#### Recovering State

One of the worst things that you happen is loosing the terraform state. In such a case you can

```
terraform import <address> <id>
```

for example:
```
terraform import aws_instance.myec2instance i-007007007007007aa
```

to let terraform reconstruct the resource state. Finally perform a

```
terraform state push
```

as import only imports into a local state file, even if you have an S3 bucket defined for keeping state! 
To avoid this use S3 bucket with versioning enabled for keeping state.
