# Telegram SOCKS5 Proxy 🚀

A lightweight, high-performance Dante SOCKS5 proxy configured specifically for Telegram. This repository supports two deployment methods: containerized deployment (for platforms like Koyeb) and direct installation (for traditional Linux VPS environments).

---

## 📂 Repository Structure

* `Dockerfile` — Used for deploying on cloud platforms like Koyeb.
* `start.sh` — Used for quick installation on a Linux VPS (Ubuntu/Debian).

---

## ☁️ Method 1: Deploy on Koyeb (Free Tier Supported)

Koyeb allows you to run this proxy 24/7 using their TCP Proxy feature.

### Deployment Steps
1. Create a new App on [Koyeb](https://app.koyeb.com/) and connect this GitHub repository.
2. In the **Builder** section, ensure Koyeb is set to build using the `Dockerfile`.
3. Scroll down to the **Ports** section.
4. Set the Port to `1080`.
5. **Crucial:** Check the box that says **Enable TCP Proxy**.
6. Click **Deploy**.

### Connection Details
Once the application status says "Healthy", check your Koyeb dashboard for the public URL and Port.
* **Server:** `<your-app-name>.koyeb.app`
* **Port:** The random TCP port assigned by Koyeb (e.g., `14552`)
* **Username:** `meow`
* **Password:** `meow`

---

## 🖥️ Method 2: Deploy on a Linux VPS (Ubuntu/Debian)

If you are using a standard Virtual Private Server (VPS) like DigitalOcean, Hetzner, AWS, or Oracle Cloud, use the provided bash script. The script automatically installs Dante, creates the user, configures the firewall, and starts the service.

### Installation Steps
Run the following commands in your VPS terminal as `root` or using `sudo`:

```bash
# 1. Clone this repository (or download start.sh)
git clone <your-github-repo-url>
cd <your-repo-folder>

# 2. Make the script executable
chmod +x start.sh

# 3. Run the installer
sudo bash start.sh
