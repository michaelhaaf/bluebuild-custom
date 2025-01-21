#!/usr/bin/env bash

# Tell this script to exit if there are any errors.
# You should have this in every custom script, to ensure that your completed
# builds actually ran successfully without any errors!
set -oue pipefail

# # See: https://github.com/probonopd/go-appimage/issues/232#issuecomment-2081508276
# ln_opts=(
#   # Create a symbolic link instead of a hard link
#   --symbolic
#
#   # Specify the last argument is the created link path, not a target directory
#   # to create a link to
#   --no-target-directory
#
#   # Show what is actually done
#   --verbose
# )
# ln "${ln_opts[@]}" ~/.local/bin/applications ~/Applications

# See: https://github.com/probonopd/go-appimage/blob/master/src/appimaged/README.md#initial-setup
# Download
mkdir -p ~/Applications
wget -c https://github.com/$(wget -q https://github.com/probonopd/go-appimage/releases/expanded_assets/continuous -O - | grep "appimaged-.*-x86_64.AppImage" | head -n 1 | cut -d '"' -f 2) -P ~/Applications/
chmod +x ~/Applications/appimaged-*.AppImage
