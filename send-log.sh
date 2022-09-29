# send-log.sh
#
# Script to send a new log entry to the listener on the server.
# Must be used as part of the initial live response.
# Adapted by nCKbr from the original version by Dr. Phil Polstra - Polstra (2015)
[ -z “$RHOST” ] && { export RHOST=localhost; }
[ -z “$RPORT” ] && { export RPORT=4444; }
usage () {
 echo “usage: $0 <command or script>”
echo “Script to send a new log entry into the listener in the server”
 exit 1
}
# você especificou um comando?
if [ $# -lt 1 ] ; then
 usage
else
 echo -e “++++Sending log to $@ at $(date) ++++\n $($@) \n–-end–-\n” | nc
$RHOST $RPORT
fi