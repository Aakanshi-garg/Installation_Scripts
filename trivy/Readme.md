# 🔍 Trivy Setup Guide

**Trivy** (by Aqua Security) is a simple and comprehensive security scanner for:
- Container Images
- Filesystems
- Git Repositories
- SBOMs (Software Bill of Materials)

> This guide walks you through installing and using Trivy on a Debian/Ubuntu system.

---

## Install Trivy (Linux)
###  Prerequisites
- OS: Ubuntu/Debian-based
- Internet connection
- `curl` and `gpg` installed

### Installation Steps

```bash
# Add Trivy's GPG key
sudo apt-get install -y gnupg curl
curl -fsSL https://aquasecurity.github.io/trivy-repo/deb/public.key | sudo gpg --dearmor -o /usr/share/keyrings/trivy.gpg

# Add Trivy's APT repository
echo "deb [signed-by=/usr/share/keyrings/trivy.gpg] https://aquasecurity.github.io/trivy-repo/deb stable main" | \
sudo tee /etc/apt/sources.list.d/trivy.list

# Update package list and install Trivy
sudo apt-get update
sudo apt-get install -y trivy
```
# Verify Installation
```
trivy --version
```
# Scan Docker Images
```
trivy image nginx:latest
```
# Scan Local File System
``` 
trivy fs /path/to/your/project
```
# Scan Git Repository
```
trivy repo https://github.com/<username>/<repository>
```
# Scan Kubernetes Cluster 
Install kubectl and configure cluster context, then:
``` 
trivy k8s --report summary cluster
```
