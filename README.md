# docker-env-test

# **🚀 Dotfiles Setup & Testing with Docker**

This repository is designed to **test, deploy, and configure your dotfiles** across multiple OS environments using **Docker**. It ensures your setup script runs correctly in **macOS, Linux (Ubuntu, Arch, Alpine), and Windows environments**.

---

## **📌 Features**

- Automatically downloads & runs the setup script from **GitHub**
- Works across **macOS, Linux, and Windows**
- Uses **Docker containers** to simulate real OS environments
- Ensures correct dependencies exist before running the setup
- Handles OS-specific package managers (**Homebrew, apt, pacman, Chocolatey**)

---

## **📂 Folder Structure**

```
docker-env-test/
│── docker-compose.yml       # Defines OS-specific Docker containers
│── Dockerfile.ubuntu        # Ubuntu container
│── Dockerfile.arch          # Arch Linux container
│── Dockerfile.alpine        # Alpine Linux container
│── Dockerfile.windows       # Windows container
│── run.sh                   # Automatically runs correct containers
│── entrypoint.sh            # Runs the setup script inside Linux/macOS containers
│── entrypoint.ps1           # Runs the setup script inside Windows containers
│── README.md                # This documentation
```

---

## **🚀 Getting Started**

### **1️⃣ Clone This Repository**

```sh
git https://github.com/thenameiswiiwin/docker-env-test.git ~/docker-env-test
cd ~/docker-env-test
```

---

### **2️⃣ Install Docker**

Make sure you have **Docker** installed on your system:

- **📌 macOS/Linux:** [Install Docker](https://docs.docker.com/get-docker/)
- **📌 Windows:** [Install Docker Desktop](https://docs.docker.com/desktop/install/windows-install/)

---

### **3️⃣ Run the Setup Script**

Run the script to **automatically build and test your dotfiles**:

```sh
./run.sh
```

This will:

- Detect your OS
- Start **Ubuntu, Arch, and Alpine** containers (on macOS/Linux)
- Start **Windows container** (on Windows)
- Download and execute the **setup script** inside each container

---

## **🛠 Manual Docker Usage**

You can also **manually build and run** each OS environment.

### **🔹 Ubuntu**

```sh
docker build -t test-ubuntu -f Dockerfile.ubuntu .
docker run -it --rm test-ubuntu
```

### **🔹 Arch Linux**

```sh
docker build -t test-arch -f Dockerfile.arch .
docker run -it --rm test-arch
```

### **🔹 Alpine Linux**

```sh
docker build -t test-alpine -f Dockerfile.alpine .
docker run -it --rm test-alpine
```

### **🔹 Windows**

```sh
docker build -t test-windows -f Dockerfile.windows .
docker run -it --rm test-windows
```

---

## **📜 How It Works**

### **📌 `run.sh` (Main Script)**

Automatically detects your OS and starts the correct containers.

### **📌 `entrypoint.sh` (Linux/macOS Containers)**

- **Downloads & runs the setup script** from GitHub
- Ensures proper permissions & execution

```bash
#!/usr/bin/env bash
set -euo pipefail
echo "Downloading and running setup script..."
curl -fsSL https://raw.githubusercontent.com/thenameiswiiwin/.dotfiles/main/resources/setup -o ~/setup.sh
chmod +x ~/setup.sh
bash ~/setup.sh
echo "Setup script completed!"
exec /bin/bash
```

### **📌 `entrypoint.ps1` (Windows Containers)**

Runs the setup script inside a Windows PowerShell environment.

```powershell
Write-Host "Downloading and running setup script..."
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/thenameiswiiwin/.dotfiles/main/resources/setup" -OutFile "$HOME\setup.ps1"
powershell.exe -ExecutionPolicy Bypass -File "$HOME\setup.ps1"
Write-Host "Setup script completed!"
cmd.exe
```

---

## **❓ Troubleshooting**

### **🛑 Docker Not Found**

Make sure Docker is installed and running:

```sh
docker --version
```

### **🛑 Windows Container Fails to Start**

Windows containers require **Docker Desktop** in **Windows Container Mode**. Run:

```powershell
wsl --set-version Ubuntu 2
```

### **🛑 "Permission Denied" on Linux/macOS**

If you get permission issues, run:

```sh
chmod +x run.sh entrypoint.sh
```

---

## **📌 Contributing**

1. Fork the repository
2. Create a feature branch: `git checkout -b feature-name`
3. Commit your changes: `git commit -m "Add feature"`
4. Push to the branch: `git push origin feature-name`
5. Submit a pull request 🚀

---
