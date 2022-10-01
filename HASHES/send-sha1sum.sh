# send-sha1sum.sh
#
# Script to calculate sha1
# Must be used as part of the initial live response.
# Adapted by nCKbr from the original version by Dr. Phil Polstra - Polstra (2015)
usage () {
 echo “usage: $0 <starting directory>”
 echo “Script to send SHA1 hashes to a log listener”
 exit 1
}
if [ $# -lt 1 ] ; then
 usage
fi
# find only files, don't look for other filesystems
# run command sha1sum -b <filename> for all found files
send-log.sh find $1 -xdev -type f -exec sha1sum -b {} \;
