#!/bin/bash

# CIS 13.13 Check User Home Directory Ownership
# This script checks to make sure users own the home directory they
# are assigned to in the /etc/passwd file.

cat /etc/passwd | awk -F: '{ print $1 " " $3 " " $6 }' | while read user uid dir; do
    if [ $uid -ge 500 -a -d "$dir" -a $user != "nfsnobody" ]; then
        owner=$(stat -L -c "%U" "$dir")
        if [ "$owner" != "$user" ]; then
            echo "The home directory ($dir) of user $user is owned by $owner."
        fi
    fi
done
