#!/bin/bash

# CIS 13.15 Check for Duplicate GIDs
# This script checks to make sure all UIDs in the /etc/group file
# are unique. You can also use the /usr/sbin/grpck command to
# check for other inconsistencies in the /etc/group file

/bin/cat /etc/group | /usr/bin/cut -f3 -d":" | /usr/bin/sort -n | /usr/bin/uniq -c | while read x ; do
    [ -z "${x}" ] && break
    set - $x
    if [ $1 -gt 1 ]; then
        grps=`/usr/bin/awk -F: '($3 == n) { print $1 }' n=$2 /etc/group | xargs`
        echo "Duplicate GID ($2): ${grps}"
    fi
done
