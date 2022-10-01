# send-logfiles.sh
#
# Script to send the log files
# Must be used as part of the initial live response.
# Adapted by nCKbr from the original version by Dr. Phil Polstra - Polstra (2015)
usage() {
 echo “usage: $0 “
 echo “Script to send log files into the log listener”
 exit 1
}
if [ $# -gt 0 ] ; then
 usage
fi
# find only files, no numbers - indicates they are old files
# run echo, cat, and echo for all found files
send-log.sh find /var/log -type f -regextype posix-extended \
-regex ‘/var/log/[a-zA-Z.]+(/[a-zA-Z.]+)*’ \
-exec echo -e “–dumping logfile {} –\n” \; \
-exec cat {} \;
-exec echo -e “–end of dump for logfile {} –\n” \;