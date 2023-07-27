#### foreach

example
```
locals {
  settings = {
    "key1"  = { prop1 = "xxx", prop2 = false },
    "key2"   = { prop1 = "yyy", prop2 = true },
    [...]
  }
}

resource "myresourcetype" "map" {
  for_each      = local.settings

  name          = each.key
  prop1         = each.value.prop1
  prop2         = each.value.prop2
  prop3         = "some constant"
}
```
