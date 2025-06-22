#!/bin/bash
export DEBIAN_FRONTEND=noninteractive

# --- MANUAL GPG KEY ---
echo "Manually downloading and installing the new Kali GPG archive key..."
wget https://archive.kali.org/archive-keyring.gpg -O /usr/share/keyrings/kali-archive-keyring.gpg
echo "Key installed. Now updating package lists..."
# --- END OF PGP ---


# --- GPG KEY and UPDATE ---
echo "Updating package lists and fixing GPG key error..."
# This first update might show GPG warnings, that is okay.
apt-get update -y
# Now, we install the package containing the latest Kali repository keys.
apt-get install -y kali-archive-keyring
# Now that the keys are updated, we run update again. This one should be clean.
echo "Running update again with the correct keys..."
apt-get update -y
# --- END OF PGP UPDATE ---


# --- Disable ASLR ---
echo "Disabling ASLR..."
echo "kernel.randomize_va_space = 0" > /etc/sysctl.d/01-disable-aslr.conf
sysctl -p /etc/sysctl.d/01-disable-aslr.conf


# --- Install Everything from Kali's Repositories ---
echo "Installing Kali Desktop, RE tools, and dependencies..."
apt-get install -y \
    kali-desktop-xfce \
    ghidra \
    rizin-cutter \
    radare2 \
    build-essential \
    git \
    openjdk-21-jdk \
    python3-pwntools

# --- Compile the lab binary ---
if [ -f /vagrant/Makefile ]; then
    echo "Compiling the lab binary in /vagrant..."
    cd /vagrant
    make
    chown -R kali:kali /vagrant # Use kali user/group
fi

echo "Provisioning complete. You may need to reboot with 'vagrant reload'."