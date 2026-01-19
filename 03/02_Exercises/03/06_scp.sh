#!/bin/bash
#
# Set variable for target node (your AWS EC2 instance)
TARGET="ubuntu@ec2-54-227-124-119.compute-1.amazonaws.com"
# Set variable for target directory where the app should be stored
TARGET_DIR="/home/ubuntu/trafficlight-app"
# Set private key
PRIVATE_KEY="~/.ssh/mvarela.pem"
# check if private key is set
if [ ! -f "$PRIVATE_KEY" ]; then
  echo "Error: Private key $PRIVATE_KEY not found!"
  exit 1
fi
# remove (with ssh) target directory for the app
ssh -i $PRIVATE_KEY $TARGET "rm -rf $TARGET_DIR"
# create (with ssh) target directory for the app
ssh -i $PRIVATE_KEY $TARGET "mkdir -p $TARGET_DIR"
# copy (with scp) all bash script to destination
scp -i $PRIVATE_KEY *.sh $TARGET:$TARGET_DIR/
# copy (with scp) the backend to destination
scp -i $PRIVATE_KEY -r backend/ $TARGET:$TARGET_DIR/
# copy (with scp) dockerfile to destination
scp -i $PRIVATE_KEY Dockerfile $TARGET:$TARGET_DIR/
# copy (with scp) unit testing files to destination
scp -i $PRIVATE_KEY package.json $TARGET:$TARGET_DIR/
scp -i $PRIVATE_KEY trafficlight.test.js $TARGET:$TARGET_DIR/

echo "Files successfully copied to $TARGET:$TARGET_DIR"