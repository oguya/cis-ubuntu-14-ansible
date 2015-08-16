## Deploy CIS Benchmarks on Ubuntu 14.04 hosts using Ansible
[![Build Status](https://travis-ci.org/oguya/cis-ubuntu-14-ansible.svg)](https://travis-ci.org/oguya/cis-ubuntu-14-ansible)

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

### Usage

> **NOTE**<br/>
> Don't run this playbook blindly on an active production system! It will make modifications your systems that you may or may not intend to have.

- clone this repo:

        git clone https://github.com/oguya/cis-ubuntu-14-ansible.git
        cd cis-ubuntu-14-ansible

- add your target host in the [inventory](http://docs.ansible.com/intro_inventory.html) `hosts` file, for example: `ubuntu01` host as the target host belonging to the `ubuntu` group:

        [ubuntu]
        ubuntu01

- create a host variable file in the `host_vars/` directory for your target host. e.g. `host_vars/ubuntu01`, whereby [ansible_ssh_host](http://docs.ansible.com/intro_inventory.html#list-of-behavioral-inventory-parameters) is the ip address of the target host.

        ---
        ansible_ssh_host: 172.26.23.225

- dry run the playbook:

        ansible-playbook cis.yml -K --check

- dry run a particular section, e.g. section 8.1.8

        ansible-playbook cis.yml -K --tags=section8.1.8 --check

- run benchmarks listed in Level 1

        ansible-playbook cis.yml -K --tags=level-1

- run benchmarks listed in Level 2

        ansible-playbook cis.yml -K --tags=level-2

- run all **_scored_** benchmarks

        ansible-playbook cis.yml -K --tags=scored

- run all **_not scored_** benchmarks

        ansible-playbook cis.yml -K --tags=notscored

- run **_scored_**(i.e. ignore **_not scored_**) benchmarks listed in Level 1

        ansible-playbook cis.yml -K --tags=level-1 --skip-tags=notscored

- run **_not scored_**(i.e. ignore **_scored_**) benchmarks listed in Level 2

        ansible-playbook cis.yml -K --tags=level-2 --skip-tags=scored

- if you want to run Section 12, you will probably want to override the default variables `allowed_suid_binaries` and `allowed_sgid_binaries` with a whitelist of binary paths that should be allowed.


### Assumptions
I took into assumption, a few key items when running this playbook:
- you have a provisioning user account with passwordless SSH access to the target host
- the provisioning user has sudo privileges on the remote host

### Similar Playbooks
- [Major Hayden's](https://major.io/2014/08/19/audit-rhelcentos-6-security-benchmarks-ansible/) [ansible playbooks](https://github.com/major/cis-rhel-ansible) for applying CIS Security Benchmarks to Red Hat Enterprise Linux 6 or CentOS 6 systems.

### Contribution
[Pull requests](https://github.com/oguya/cis-ubuntu-14-ansible/pulls) and [Github issues](https://github.com/oguya/cis-ubuntu-14-ansible/issues) are all welcome!
