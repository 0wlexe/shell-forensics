#!/bin/bash
#
# start-case.sh

# Simple script to start a new case at a forensic station.
# Create a new folder if necessary and start two listeners.
# Adapted by nCKbr from the original version by Dr. Phil Polstra - Polstra (2015)

usage () {
    echo “usage: $0 <case number>”
    echo “Script for the creation of the (sfc) and start listeners”
 exit 1
}

if [ $# -lt 1 ] ; then
 usage
else
 echo “Start case $1”
fi
# Start file directory
if [ ! -d $1 ] ; then
 mkdir $1
fi
# Create the log listener 
`nc -k -l 4444 >> $1/log.txt` &
echo “Started the listener for the case $1 at $(date)” | nc localhost 4444
# Start the listener of files
`./start-file-listener.sh $1` &