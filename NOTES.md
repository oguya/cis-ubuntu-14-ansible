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


### Section 10

#### 10.5 Lock Inactive User Accounts (Scored)
Skipped: Evaluate your infrastructure first, before locking inactive accounts


### Section 11

#### 11.2 Remove OS Information from Login Warning Banners (Scored)

Skipped: Evaluate your infrastructure first, before locking inactive accounts

#### 11.3 Set Graphical Warning Banner (Not Scored)

Skipped: Set a banner for the display manager in use consistent with your organizations policy


### Section 12

#### 12.7 Find World Writable Files (Not Scored)

Skipped: Evaluate your infrastructure before removing world writable files

#### 12.8 Find Un-owned Files and Directories (Scored)

Skipped: You can run the following command to find files that are owned by users or groups not listed in the system configuration files, and reset the ownership of these files to some active user on the system

    shell: df --local -P | awk {'if (NR!=1) print $6'} | xargs -I '{}' find '{}' -xdev -nouser - ls

#### 12.9 Find Un-grouped Files and Directories (Scored)

Skipped: You can run the following command to find files that are owned by users or groups not listed in the system configuration files, and reset the ownership of these files to some active user on the system

    shell: df --local -P | awk {'if (NR!=1) print $6'} | xargs -I '{}' find '{}' -xdev -nouser - ls

#### 12.10 Find SUID System Executables (Not Scored)

Skipped: You can run the following command to find & ensure that no rogue set-UID programs have been introduced into the system

    df --local -P | awk {'if (NR!=1) print $6'} | xargs -I '{}' find '{}' -xdev -type f -perm -4000 -print

#### 12.11 Find SGID System Executables (Not Scored)

Skipped: Ensure that no rogue set-GID programs have been introduced into the system

    df --local -P | awk {'if (NR!=1) print $6'} | xargs -I '{}' find '{}' -xdev -type f -perm -2000 -print


### Section 13

#### 13.1 Ensure Password Fields are Not Empty (Scored)

Skipped: Evaluate your infrastructure before locking passwordless accounts

    /bin/cat /etc/shadow | /usr/bin/awk -F: '($2 == "" ) { print $1 " does not have a password "}'

#### 13.2 Verify No Legacy "+" Entries Exist in /etc/passwd File (Scored)

Skipped: Delete entries in /etc/password provided by `grep '^+:' /etc/passwd`

#### 13.3 Verify No Legacy "+" Entries Exist in /etc/shadow File (Scored)

Skipped: Delete entries in /etc/shadow provided by `grep '^+:' /etc/shadow`

#### 13.4 Verify No Legacy "+" Entries Exist in /etc/group File (Scored)

Skipped: Delete entries in /etc/group provided by `grep '^+:' /etc/group`

#### 13.7 Check Permissions on User Home Directories (Scored)

Skipped: Making global modifications to user home directories without alerting the user community can result in unexpected outages and unhappy users.

#### 13.8 Check User Dot File Permissions (Scored)

Skipped: Making global modifications to user home directories without alerting the user community can result in unexpected outages and unhappy users.

#### 13.9 Check Permissions on User .netrc Files (Scored)

Skipped: Making global modifications to user home directories without alerting the user community can result in unexpected outages and unhappy users

#### 13.10 Check for Presence of User .rhosts Files (Scored)

Skipped: If any users have .rhosts files determine why they have them

#### 13.19 Check for Presence of User .forward Files (Scored)

Skipped: Making global modifications to users' files without alerting the user community can result in unexpected outages and unhappy users

#### 13.20 Ensure shadow group is empty (Scored)

Skipped: Remove all users from the shadow group, and change the primary group of any users with shadow as their primary group.

    grep ^shadow /etc/group && awk -F: '($4 == "<shadow-gid>") { print }' /etc/passwd
