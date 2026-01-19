#!/usr/bin/bash
# Attention:
# Change CRLF (Windows) to LF (Unix on AWS) in your Editor
#
# Set variable PARAMS
PARAMS="01_params.sh"

# check if PARAMS is set else exit
if [ ! -f "${PARAMS}" ]; then
  echo "Error: ${PARAMS} not found"
  exit 1
fi

# import PARAMS
source ${PARAMS}

# if exists remove old jenkins_home
if [ -d "jenkins_home" ]; then
  echo "Removing old jenkins_home directory"
  rm -rf jenkins_home
fi
mkdir -p jenkins_home

# run image
echo "run now container"
docker run -d \
  --privileged \
  --name ${container3} \
  -p 8080:8080 -p 50000:50000 \
  -v "$(pwd)/jenkins_home:/var/jenkins_home" \
  ${user}/${image3}

echo "Waiting for container to start..."
sleep 5

# start docker environment in the container
echo "Starting Docker daemon in container..."
docker exec -d ${container3} dockerd

echo "Waiting for Docker daemon to initialize..."
sleep 5

# start Jenkins
echo "Starting Jenkins..."
docker exec -d ${container3} jenkins
