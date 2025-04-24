#!/bin/bash

if [ $( whoami ) == root ]; then 
  echo "You running it below root." 
  echo "Login a normal user with sudo rights"
  exit 0
fi

if test -d ../../.config/; then
  echo "Work directory is must to be subfolder to .config"
  exit 0
fi

# Install pacman packages
sudo pacman -Syu
sudo pacman -Sy \
    zoxide \
    lightdm \
    lightdm-gtk-greeter \
    feh \
    git \
    eza \
    i3-wm \
    rofi \
    neovim \
    picom \
    polybar \
    kitty \
    zsh \
    yazi \
    fastfetch \
    dunst \
    obsidian \
    telegram-desktop \

# Install "oh my zsh."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install yay
git clone https://aur.archlinux.org/yay.git 
makepgk -si -p /tmp/yay/PKGBUILD

# Install yay packages
yay -S zen-browser-bin

# Setup dotfiles
ln -sf $(pwd)/* ../
mv ../.zshrc $HOME

# SystemD services
sudo systemctl enable lightdm

# Done!
echo "Done! Reboot to apply settings"

