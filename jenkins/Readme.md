# Install jenkins on Ubuntu
This guide provides a simple Bash script to install Jenkins on an Ubuntu system using OpenJDK 17.
# Prerequisites
- A system running Ubuntu
- sudo privileges
# Installation Script

``` bash
#!/bin/bash

# Install OpenJDK 17 JRE Headless
sudo apt install openjdk-17-jre-headless -y

# Download Jenkins GPG key
sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key

# Add Jenkins repository to package manager sources
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null

# Update package manager repositories
sudo apt-get update

# Install Jenkins
sudo apt-get install jenkins -y
```
Save this script in a file, for example, install_jenkins.sh, and make it executable using:
``` bash
chmod +x install_jenkins.sh
```
Then, you can run the script using:
``` bash
./install_jenkins.sh
```
# Check Jenkins Status
Verify if Jenkins is running:
``` bash
sudo systemctl status jenkins
```
# Enable Jenkins on Boot
Ensure Jenkins starts automatically after a reboot:
``` bash
sudo systemctl enable jenkins
```
# Access Jenkins
Once installed and running, Jenkins can be accessed at:
``` bash
http://<your-server-ip>:8080
```
To get the initial admin password, run:
``` bash
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
```
✅ You're now ready to start using Jenkins to automate your development workflows.
