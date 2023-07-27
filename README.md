# UNDER CONSTRUCTION

## terraform
The terraform modules use by our devops/sre team

### Background
- the team maintains serveral kubernetes clusters in US, EU and ASIA
- we use a pfsense instance to access the infrastructure from a central point
- all regions are connected to each other
- we use LDAP for authentication, pfsense and SSH
- each regions runs a LDAP replica
- each region has their on pfsense, that is only activate if needed
- the central point regions has a IPSec connection to the office using pfsense on both side
- the main LDAP server is in the office
- we use [letsencrypt](https://letsencrypt.org/) for our LDAP and other certs
- we use [ansible](https://letsencrypt.org/) to keep our infrastructure updated and OS patch
 
### Notes
- suggestions are *very* welcome! always love to improve our code
- work in progress
- we are looking to us IPv6 once the cloud providers supports [RFC 4193](https://datatracker.ietf.org/doc/html/rfc4193)
- we use [RFC 7793](https://datatracker.ietf.org/doc/html/rfc7793),a /30 for our IPSec connections


### handy command
- terraform plan                                        # dry run
- terraform apply
- terraform apply -input=false -auto-approve tfplan     # applying previously create plan
- terraform refresh                                     # sync state with remote resources
- terraform show
- terraform destroy
- terraform validate                                    # validate .tf file
- terraform taint                                       # mark resource for recreation
- terraform untaint
- terraform state push                                  # e.g. force push state to S3 bucket
- terraform state pull > terraform.tfstate              # create a local state copy
- terraform force-unlock <lock-id-guid>                 # Clean up leftover locks from hard-cancelled run 

__** important **__
Always run `plan` and make sure the changes will not delete any resource that is not suppose too

#### keep secrets/password save
- create a file with your secrets/passwword lets call it `secrets.tfvars` 
example user and password for an OpenSearch cluser and Postgress RDS database
```
es_master_user_name         = "esuser"
es_master_user_password     = "SuperSuperScrethe?"

rds_postgres_user_name       = "psqluser"
rds_postgres_user_passqword  = "moreSecureThanEver!"
```

- to use the secret file
terraform plan -var-file secrets.tfvars -out terraform.plan 
terraform apply -var-file secrets.tfvars

### The End
Your friendly BOFH 🦄 😈          
