#!/bin/bash

# CIS 13.11 Check Groups in /etc/passwd
# Groups defined in the /etc/passwd file but not in the /etc/group
# file pose a threat to system security since group permissions are
# not properly managed.

for i in $(cut -s -d: -f4 /etc/passwd | sort -u ); do
    grep -q -P "^.*?:[^:]*:$i:" /etc/group
    if [ $? -ne 0 ]; then
        echo "Group $i is referenced by /etc/passwd but does not exist in /etc/group"
    fi
done
