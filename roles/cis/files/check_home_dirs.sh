#!/bin/bash

# CIS 13.12 Check That Users Are Assigned Valid Home Directories
# If the user's home directory does not exist or is unassigned, the
# user will be placed in "/" and will not be able to write any
# files or have local environment variables set

cat /etc/passwd | awk -F: '{ print $1 " " $3 " " $6 }' | while read user uid dir; do
    if [ $uid -ge 500 -a ! -d "$dir" -a $user != "nfsnobody" -a $user != "nobody" ]; then
        echo "The home directory ($dir) of user $user does not exist."
    fi
done
