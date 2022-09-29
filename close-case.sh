#!/bin/bash
#
# close-case.sh
#
# Simple script to turn off all listeners.
# Must be used as part of the initial live response.
# Adapted by nCKbr from the original version by Dr. Phil Polstra - Polstra (2015)
echo “Turning off listeners in $(date) at user request” | nc localhost 4444
killall start-case.sh
killall start-file-listener.sh
killall nc