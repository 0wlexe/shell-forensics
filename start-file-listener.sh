#!/bin/bash
#
# start-file-listener.sh
#
# Simple script to start a new file listener.
# Must be used as part of the initial live response.
# Adapted by nCKbr from the original version by Dr. Phil Polstra - Polstra (2015)
# When a filename is sent to port 5555, transfer to port 5556
usage () {
 echo “usage: $0 <case name>”
 echo “Script to start a new file listener”
 exit 1
}
if [ $# -lt 1 ] ; then
 usage
fi
while true
do
 filename=$(nc -l 5555)
 nc -l 5556 > $1/$(basename $filename)
done