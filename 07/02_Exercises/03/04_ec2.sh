#!/bin/bash
#
# Copy this script to ~/.ssh
ssh -i "~/.ssh/<your-private-key>.pem" -L 9000:localhost:9000 \
    ubuntu@<your-ec2-instance-ip>

