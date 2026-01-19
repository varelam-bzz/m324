#!/bin/bash
# Attention:
# Change CRLF (Windows) to LF (Unix on AWS) in your Editor
#
# Pull sonarqube
docker pull sonarqube:latest
# Run sonarqube
docker run -d --name sonarqube -p 9000:9000 sonarqube:latest
