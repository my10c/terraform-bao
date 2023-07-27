#### Drift Management
Terraform doesn’t really do much drift management. Only some resource attributes are checked. 
All detected drift is fixed by “apply”.

Manually dump drift
```
terraform show >before
terraform refresh
terraform show >after
   
diff -u before after
```

Prevent auto-destroy:

```
 lifecycle {
    prevent_destroy = true
 } 
```
