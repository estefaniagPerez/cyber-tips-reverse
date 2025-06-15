#!/bin/bash

# --- Disable ASLR ---
echo "Disabling ASLR..."
echo "kernel.randomize_va_space = 0" > /etc/sysctl.d/01-disable-aslr.conf
sysctl -p /etc/sysctl.d/01-disable-aslr.conf

# --- Install Dependencies ---
echo "Updating package lists and installing dependencies..."
export DEBIAN_FRONTEND=noninteractive
apt-get update
apt-get install -y build-essential gcc make git unzip openjdk-17-jdk

echo "Installing Graphical Desktop Environment (Xubuntu)..."
# This step will take a significant amount of time
apt-get install -y xubuntu-desktop

# --- Install radare2 ---
echo "Installing radare2..."
git clone https://github.com/radareorg/radare2.git /opt/radare2
/opt/radare2/sys/install.sh

# --- Install Ghidra ---
echo "Installing Ghidra..."
GHIDRA_VERSION="11.0.1"
GHIDRA_ZIP="ghidra_${GHIDRA_VERSION}_PUBLIC_20240130.zip"
wget "https://github.com/NationalSecurityAgency/ghidra/releases/download/Ghidra_${GHIDRA_VERSION}_build/${GHIDRA_ZIP}" -O "/tmp/${GHIDRA_ZIP}"
unzip "/tmp/${GHIDRA_ZIP}" -d /opt/
mv /opt/ghidra* "/opt/ghidra"
ln -s /opt/ghidra/ghidraRun /usr/local/bin/ghidra

# --- Install Cutter ---
echo "Installing Cutter..."
CUTTER_VERSION="v2.4.0"
CUTTER_APPIMAGE="Cutter-${CUTTER_VERSION}-x86_64.AppImage"
wget "https://github.com/rizinorg/cutter/releases/download/${CUTTER_VERSION}/${CUTTER_APPIMAGE}" -O /opt/Cutter.AppImage
chmod +x /opt/Cutter.AppImage
ln -s /opt/Cutter.AppImage /usr/local/bin/Cutter

# --- Create Desktop Shortcuts for easy access ---
DESKTOP_DIR="/home/vagrant/Desktop"
mkdir -p "${DESKTOP_DIR}"
chown -R vagrant:vagrant /home/vagrant

# Cutter Desktop Shortcut
echo "[Desktop Entry]
Version=1.0
Type=Application
Name=Cutter
Comment=Reverse Engineering Platform
Exec=/usr/local/bin/Cutter
Icon=/usr/share/icons/hicolor/256x256/apps/cutter.png
Categories=Development;
Terminal=false" > "${DESKTOP_DIR}/Cutter.desktop"

# Ghidra Desktop Shortcut
echo "[Desktop Entry]
Version=1.0
Type=Application
Name=Ghidra
Comment=Software Reverse Engineering Framework
Exec=/usr/local/bin/ghidra
Icon=/opt/ghidra/support/ghidra.ico
Categories=Development;
Terminal=false" > "${DESKTOP_DIR}/Ghidra.desktop"

chmod +x "${DESKTOP_DIR}/Cutter.desktop"
chmod +x "${DESKTOP_DIR}/Ghidra.desktop"
chown vagrant:vagrant "${DESKTOP_DIR}"/*.desktop

# --- Compile the lab binary ---
echo "Compiling the lab binary..."
# Navigate to the synced project directory
cd /vagrant
# Run make to compile the binary
make
# Optional: If you want to clean up the object files after compilation
# make clean

# Change ownership of the entire project folder to the vagrant user
# This ensures students can easily read/write/execute the files
chown -R vagrant:vagrant /vagrant

echo "Provisioning complete. You can now access the VM with 'vagrant ssh'."