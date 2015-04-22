#!/bin/bash

# CIS 13.14 Check for Duplicate UIDs
# This script checks to make sure all UIDs in the /etc/passwd file
# are unique.

/bin/cat /etc/passwd | /usr/bin/cut -f3 -d":" | /usr/bin/sort -n | /usr/bin/uniq -c | while read x ; do
    [ -z "${x}" ] && break
    set - $x
    if [ $1 -gt 1 ]; then
        users=`/usr/bin/awk -F: '($3 == n) { print $1 }' n=$2 /etc/passwd | /usr/bin/xargs`
        echo "Duplicate UID ($2): ${users}"
    fi
done
