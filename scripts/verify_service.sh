#!/bin/bash

PUBLIC_IP=47.129.175.128

# Check if the application is running on port 8080 using the public IP address
curl -Is http://47.129.175.128:8080 | head -n 1 | grep "200 OK" > /dev/null

if [ $? -eq 0 ]; then
  echo "Application is running successfully."
else
  echo "Application failed to start."
  exit 1
fi
