### Deploy CIS Benchmarks on Ubuntu 14.04 hosts using Ansible

This is an Ansible playbook for deploying [CIS Security Benchmarks](http://benchmarks.cisecurity.org/) to system(s) running Ubuntu 14.04.

### CIS Security Benchmarks
"The CIS Security Benchmarks program provides well-defined, unbiased & consensus-based industry best practices to help organizations assess and improve their security.
Resources include secure configuration benchmarks, automated configuration assessment tools and content, security metrics and security software product certifications..."*[read more](https://benchmarks.cisecurity.org/about/)*

CIS benchmarks & recommendations are grouped into two(2) level - Level 1 & Level 2.

**Level 1**
Items in this profile intend to:
- be practical and prudent
- provide a clear security benefit
- have minimum effect on production workload

**Level 2**
This is an extension of Level 1 but with the following characteristics:
- intended for environments or use cases where security is paramount
- acts as a defense in depth measure
- have great effect on production workload


CIS benchmarks are scored to indicate whether compliance with the given recommendation impacts the assessed target's benchmark score. A benchmark can either be **scored** or **not scored**:

**Scored**
- Failure to comply with "Scored" recommendations will decrease the final benchmark score
- Compliance with "Scored" recommendations will increase the final benchmark score

**Not Scored**
- Failure to comply with "Not Scored" recommendations will not decrease the final benchmark score
- Compliance with "Not Scored" recommendations will not increase the final benchmark score

### Ansible Playbook
This playbook will configure your system to meet at most all of the CIS Security benchmarks. Please note that some of the recommendations from CIS Benchmarks can not be automated & deployed via ansible playbooks. Therefore, you'll have to apply such recommendations manually.

Before, deploying CIS Security Benchmarks & recommendations to your server(s), please have a look at the [documentation](https://benchmarks.cisecurity.org/downloads/show-single/?file=ubuntu1404.100)

