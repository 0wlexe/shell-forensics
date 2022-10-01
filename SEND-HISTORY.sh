# send-history.sh
#
# Script to send all users' .bash_history files
# Must be used as part of the initial live response.
# Adapted by nCKbr from the original version by Dr. Phil Polstra - Polstra (2015)
usage () {
 echo “usage: $0 “
 echo “Script to send files .bash_history to a log listener”
 exit 1
}
if [ $# -gt 0 ] ; then
 usage
fi
# find only files, file name is .bash_history
# run echo, cat, and echo for all found files
send-log.sh find /home -type f -regextype posix-extended -regex \
‘/home/[a-zA-Z.]+/.bash_history’ \
-exec echo -e “–dumping history file {} –\n” \; \
-exec cat {} \; -exec echo -e “–end dump history file {} –\n” \;
# repeat for the admin
send-log.sh find /root -type f -maxdepth 1 -regextype posix-extended \
-regex ‘/root/.bash_history’ \
-exec echo -e “–dumping history file {} –\n” \; \
-exec cat {} \; -exec echo -e “–end dump history file  {} –\n” \;