# initial-scan.sh
#
# Script to get initial information from the object system
# Must be used as part of the initial live response.
# Adapted by nCKbr from the original version by Dr. Phil Polstra - Polstra (2015)
usage () {
 echo “usage: $0 [listening host]”
 echo “Script to send a log entry to the listener”
 exit 1
}
# Have you specified the IP of the listener?
if [ $# -gt 1 ] || [ “$1” == “—help” ] ; then
 usage
fi
# Have you specified the IP of the listener?
if [ “$1” != “” ] ; then
 source setup-client.sh $1
fi
# Then run commands to collect info
send-log.sh date
send-log.sh uname -a
send-log.sh ifconfig -a
send-log.sh netstat -anp
send-log.sh lsof -V
send-log.sh ps -ef
send-log.sh netstat -rn
send-log.sh route
send-log.sh lsmod
send-log.sh df
send-log.sh mount
send-log.sh w
send-log.sh last
send-log.sh lastb
send-log.sh cat /etc/passwd
send-log.sh cat /etc/shadow
