#!/bin/bash
#
git init
git add .
git commit -m "Initial M324_trafficlight-api"
git branch -M main
git remote add origin "https://github.com/varelam-bzz/traffic-light.git"
git push -u origin main
