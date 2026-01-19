#!/usr/bin/bash
# Attention:
# Change CRLF (Windows) to LF (Unix on AWS) in your Editor
#
# Set variable PARAMS
PARAMS="04/02_Exercises/a01/01_params.sh"

# check if PARAMS is set else exit
if [ ! -f "${PARAMS}" ]; then
  echo "Error: ${PARAMS} not found"
  exit 1
fi

# import PARAMS
source ${PARAMS}

# function building Image based on their Dockerfiles
buildImage() {
  local image=$1
  local dockerfile=$2
  echo "Building image ${image} from ${dockerfile}"
  docker build -t ${user}/${image} -f ${dockerfile} .
  echo "Image ${image} built successfully"
}

# Build a dockerfiles with function
buildImage ${image1} ${file1}
buildImage ${image2} ${file2}
buildImage ${image3} ${file3}