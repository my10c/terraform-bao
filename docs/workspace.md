### Terraform workspace

Terraform workspaces allow for the management of two or more different environments i.e. Dev or Prod separately without affecting the state of either environment.

```
terraform workspace new dev   
terraform workspace new test
terraform workspace new prod
terraform workspace select dev
terraform workspace select default  
terraform workspace select prod
```

#### info
[handy info](https://medium.com/capital-one-tech/deploying-multiple-environments-with-terraform-kubernetes-7b7f389e622)
