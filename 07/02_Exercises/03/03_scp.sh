#!/bin/bash
#
# Set variable for target node (your AWS EC2 instance)
DEST="ubuntu@<your-ec2-instance-ip>"
# Set private key
PRIVATE_KEY="~/.ssh/<your-private-key>.pem"
# check if private key is set
if [ ! -f "${PRIVATE_KEY}" ]; then
    echo "Private key ${PRIVATE_KEY} does not exist!"
    exit 1
fi
# Set variable for target directory where the app should be stored
DIR="~/07"

# remove (with ssh) target directory for the app
echo "Remove directory ${DIR} on ${DEST}"
ssh -i ${PRIVATE_KEY} ${DEST} "rm -rf ${DIR}"
echo "Create directory ${DIR} on ${DEST}"
# create (with ssh) target directory for the app
ssh -i ${PRIVATE_KEY} ${DEST} "mkdir -p ${DIR}"
# copy (with scp) all bash script to destination
scp -i ${PRIVATE_KEY} 0*.sh ${DEST}:${DIR}
# copy (with scp) app & sonarqube utilities to destination
scp -r -i ${PRIVATE_KEY} app ${DEST}:${DIR}