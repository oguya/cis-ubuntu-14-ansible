#!/bin/bash

# CIS 13.16 Check for Duplicate User Names
# This script checks to make sure all user names in the /etc/passwd
# file are unique

cat /etc/passwd | /usr/bin/cut -f1 -d":" | /usr/bin/sort -n | /usr/bin/uniq -c |while read x ; do
    [ -z "${x}" ] && break
    set - $x
    if [ $1 -gt 1 ]; then
        uids=`/usr/bin/awk -F: '($1 == n) { print $3 }' n=$2 /etc/passwd | xargs`
        echo "Duplicate User Name ($2): ${uids}"
    fi
done
