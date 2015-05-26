## Notes & Caveats
These notes provide more information about this playbook & how each task/recommendation was applied.
They only apply to CIS Ubuntu 14.04 benchmark version 1.0.0.

### Section 1

#### 1.1 Install Updates, Patches and Additional Security Software (Not Scored)

Updates applied & target host rebooted.

> **Caveats**<br/>
> Evaluate your infrastructure before applying updates & rebooting a target host


### Section 2

#### 2.1 - 2.4 Create Separate Partition & set nodev, nosuid, noexec option for /tmp Partition (Scored)

Existing mounts are remounted with the recommended benchmark options.

> **Caveats**<br/>
> Manually create separate partition for `/tmp`

#### 2.5, 2.7, 2.8, 2.9: Create Separate Partition for /var, /var/log/, /var/log/audit & /home Partition (Scored)

Skipped: Partition(s) NOT created. Evaluate your target host before creating new & separate partition(s).

> **Caveats**<br/>
> Manually create separate partition for `/var`, `/var/log`, `/var/log/audit` & `/home`

#### 2.6 Bind Mount the /var/tmp directory to /tmp (Scored)

Existing mount is remounted with the recommended benchmark options.

#### 2.10 Add nodev Option to /home & /run/shm Partitions (Scored)

Existing mounts are remounted with the recommended benchmark options.

#### 2.11 - 2.13 Add nodev, noexec, nosuid Options to Removable Media Partitions (Scored)

Skipped: Presumed you won't have removable media paritions on a production environment.

#### 2.17 Set Sticky Bit on All World-Writable Directories (Scored)

Skipped: Evaluate your environment before adjusting permissions across the entire filesystem(s).


### Section 3

#### 3.3 Set Boot Loader Password (Scored)

Skipped: Setting bootloader password can be destructive for systems in production

#### 3.4 Require Authentication for Single-User Mode (Scored)

Skipped: Manually set the password for root user


### Section 4

#### 4.2 Enable XD/NX Support on 32-bit x86 Systems (Not Scored)

Skipped: On 32 bit systems install a kernel with PAE support, no installation is required on 64 bit systems


### Section 8

#### 8.2.5 Configure rsyslog to Send Logs to a Remote Log Host (Scored)

Skipped: Evaluate your infrastructure first, before sending logs to remote host

#### 8.2.6 Accept Remote rsyslog Messages Only on Designated Log Hosts (Not Scored)

Skipped: Evaluate your infrastructure first, before receiving logs from remote host(s)

#### 8.4 Configure logrotate (Not Scored)

Skipped: Review /etc/logrotate.d/rsyslog to determine if the appropriate system logs are rotated according to your site policy


