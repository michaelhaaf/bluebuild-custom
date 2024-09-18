#!/usr/bin/env bash

# Tell build process to exit if there are any errors.
set -oue pipefail

gsettings set org.gnome.desktop.interface gtk-theme 'adw-gtk3-dark'
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
gsettings set org.gnome.desktop.interface icon-theme 'papirus-dark'

sed -i 's/Inherits=Adwaita/Inherits=ePapirus/' /usr/share/icons/default/index.theme

unzip -q /usr/share/fonts/et-book.zip -d /usr/share/fonts/
rm /etc/fonts/conf.d/.gitkeep

tar -xf /usr/share/themes/adw-gtk3v5.3.tar.xz -C /usr/share/themes/
tar -xzf /usr/share/icons/Papirus.tar.gz -C /usr/share/icons/
tar -xzf /usr/share/icons/Papirus-Dark.tar.gz -C /usr/share/icons/
tar -xzf /usr/share/icons/Papirus-Light.tar.gz -C /usr/share/icons/
tar -xzf /usr/share/icons/ePapirus.tar.gz -C /usr/share/icons/
tar -xzf /usr/share/icons/ePapirus-Dark.tar.gz -C /usr/share/icons/
