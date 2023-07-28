#### heredocs

How to use heredocs with Terraform

example
```
esource "aws_iam_policy" "mypolicy" {
   name = "mypolicy"
   policy = <<EOF
{
    "Version": "2020-07-01",
    "Statement": ...
}
EOF
}
```
