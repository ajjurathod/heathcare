#!/bin/bash
# Install Java
sudo apt-get update
sudo apt-get install -y openjdk-11-jdk

# Install Maven
sudo apt-get install -y maven

# Navigate to the app directory and install dependencies
cd /var/www/html
mvn clean install
