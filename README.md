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
- suggestions welcome!
- work in progress
- we are looking to us IPv6 once the cloud providers supports [RFC 4193](https://datatracker.ietf.org/doc/html/rfc4193)
- we use [RFC 7793](https://datatracker.ietf.org/doc/html/rfc7793),a /30 for our IPSec connections

### The End
Your friendly BOFH 🦄 😈          
