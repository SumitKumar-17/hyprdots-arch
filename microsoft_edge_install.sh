#!/bin/bash

# Check if the system is Debian-based or Arch-based
is_debian() {
    if [ -f /etc/debian_version ]; then
        return 0
    else
        return 1
    fi
}

is_arch() {
    if [ -f /etc/arch-release ]; then
        return 0
    else
        return 1
    fi
}

# Function to install on Debian-based systems
install_debian() {
    echo "Installing Microsoft Edge on Debian-based system..."

    # Download and install Microsoft's GPG key
    curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
    sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
    sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/edge stable main" > /etc/apt/sources.list.d/microsoft-edge-dev.list'
    sudo rm microsoft.gpg

    # Update and install Microsoft Edge
    sudo apt update
    sudo apt install microsoft-edge-stable
}

# Function to install on Arch-based systems
install_arch() {
    echo "Installing Microsoft Edge on Arch-based system..."

    # Clone the AUR repository for Microsoft Edge
    git clone https://aur.archlinux.org/microsoft-edge-stable-bin.git
    cd microsoft-edge-stable-bin || exit
    makepkg -si
}

# Main script
echo "Select the system type:"
echo "1. Debian-based (Ubuntu, Linux Mint, etc.)"
echo "2. Arch-based (Arch Linux, Manjaro, etc.)"
read -p "Enter the number of your choice: " choice

case $choice in
    1)
        if is_debian; then
            install_debian
        else
            echo "This is not a Debian-based system. Exiting..."
            exit 1
        fi
        ;;
    2)
        if is_arch; then
            install_arch
        else
            echo "This is not an Arch-based system. Exiting..."
            exit 1
        fi
        ;;
    *)
        echo "Invalid choice! Exiting..."
        exit 1
        ;;
esac
