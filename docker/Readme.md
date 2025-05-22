
# 🐳 Install Docker on Ubuntu
This guide provides a shell script to install Docker Engine, Docker CLI, containerd, and the Docker Compose plugin on an Ubuntu system.
# Prerequisites
- Ubuntu-based system 
- sudo privileges
- Internet connection
# Installation Script
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
#  Verify Docker Installation
Check Docker version:
``` bash
docker --version
```
Run a test container:
``` bash
sudo docker run hello-world
```
# Enable Docker to Start on Boot
``` bash
sudo systemctl enable docker
```
To use Docker as a non-root user:
``` bash
sudo usermod -aG docker $USER

```


