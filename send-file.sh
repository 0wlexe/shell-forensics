# send-file.sh
#
# Script to send a file to the server.
# Must be used as part of the initial live response.
# Adapted by nCKbr from the original version by Dr. Phil Polstra - Polstra (2015)
[ -z “$RHOST” ] && { export RHOST=localhost; }
[ -z “$RPORT” ] && { export RPORT=4444; }
[ -z “$RFPORT” ] && { export RFPORT=5555; }
[ -z “$RFTPORT” ] && { export RFTPORT=5556; }
usage () {
 echo “usage: $0 <filename>”
 echo “Script to send a file into the listener in the server”
 exit 1
}
# Have you specified the file?
if [ $# -lt 1 ] ; then
 usage
fi
# Record in log
echo “Trying to send the file $1 at $(date)” | nc $RHOST $RPORT
# Send the name
echo $(basename $1) | nc $RHOST $RFPORT
# Stop for the creation of the listener
sleep 5
nc $RHOST $RFTPORT < $1