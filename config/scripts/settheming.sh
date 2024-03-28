#!/usr/bin/env bash

# Tell build process to exit if there are any errors.
set -oue pipefail

gsettings set org.gnome.desktop.interface gtk-theme 'adw-gtk3-dark' 
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
gsettings set org.gnome.desktop.interface icon-theme 'papirus-dark'

sed -i 's/Inherits=Adwaita/Inherits=ePapirus/' /usr/share/icons/default/index.theme 
