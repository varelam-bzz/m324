#!/usr/bin/bash
# Attention:
# Change CRLF (Windows) to LF (Unix on AWS) in your Editor
#
# Set variable PARAMS
PARAMS="01_params.sh"
# check if PARAMS is set else exit
if [ ! -f "$PARAMS" ]; then
  echo "Error: $PARAMS not found!"
  exit 1
fi
# import PARAMS
source $PARAMS
# run image
echo "run now container $container"
docker run -d -p 3000:3000 --name $container $image

