# Set Up SonarQube on Ubuntu using Docker
This guide walks you through installing Docker and deploying SonarQube in a Docker container on Ubuntu.
# Prerequisites
- Ubuntu system
- sudo privileges
# Step 1: Install Docker
``` bash
#!/bin/bash

# Update package manager repositories
sudo apt-get update

# Install necessary dependencies
sudo apt-get install -y ca-certificates curl

# Create directory for Docker GPG key
sudo install -m 0755 -d /etc/apt/keyrings

# Download Docker's GPG key
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc

# Ensure proper permissions for the key
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add Docker repository to Apt sources
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
$(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Update package manager repositories
sudo apt-get update

sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin 
```
Save this script in a file, for example, install_docker.sh, and make it executable using:
``` bash
chmod +x install_docker.sh
```
Then, you can run the script using:
``` bash
./install_docker.sh
```
### Step 2: Run SonarQube in Docker
To run SonarQube in a Docker container with the provided command, you can follow these steps:
  1. Open your terminal or command prompt.
  2. Run the following command:
``` bash
docker run -d --name sonar -p 9000:9000 sonarqube:latest
```
This command will download the sonarqube:latest Docker image from Docker Hub if it's not already available locally. Then, it will create a container named "sonar" from this image, running it in detached mode (-d flag) and mapping port 9000 on the host machine to port 9000 in the container (-p 9000:9000 flag).

# Access SonarQube
Once the container is running, open your browser and visit:
```
http://<your-server-ip>:9000
```
If you're running locally, use:
```
http://localhost:9000
```
**Default Login Credentials**
- Username: admin 
- Password: admin
You'll be prompted to change the password upon first login.

# Optional: Manage SonarQube Container
- Stop the container:
``` 
docker stop sonar
```
- Start the container:
```
docker start sonar
```
- Remove the container (permanent):
``` 
docker rm -f sonar
```
