#!/bin/bash

# conditional statement 
if [ $1 == "" ] #  IF argument 1 is equal to nothing

then
# Print error message with hint
echo "Attention: You forgot to add an IP address"
echo "Syntax: ./simplepingsweep.sh 192.168.1"

else
# For loop
for ip in `seq 1 254`; do   # loop over range 1-254 
ping -c 1 $1.$ip |          # ping count of 1 using argument1 and for loop range
grep "64 bytes" |           # get content with 64 byte
cut -d " " -f 4 |           # get the IP address at field 4 which is defined by seperated " " for each field
tr -d ":" &                 # remove the colon ":" remaining and the “&” allows multiple instances of the loop to run at once
done
fi
