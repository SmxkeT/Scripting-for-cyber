#!/bin/bash
ip a | grep "inet6" | tail -l | awk '(print $2}' > addr.txt
echo "*********************************************"
echo && cat addr.txt
echo sha256sum addr.txt
echo "*********************************************"
