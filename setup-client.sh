# setup-client.sh
#
# Script to set environment variables
# for an investigation environment
# Must be used as part of the initial live response.
# Adapted by nCKbr from the original version by Dr. Phil Polstra - Polstra (2015)
usage () {
 echo “usage: source $0 <forensics workstation IP> [log port] [filename port] [file transfer 
port]”
 echo “Script to set environment variables for the communication with the forensic work station”
 exit 1
}
# Have you specified the file?
