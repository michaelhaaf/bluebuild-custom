# https://github.com/bsherman/ublue-custom/blob/main/usr/share/ublue-os/just/60-custom.just#L5C1-L9C48
# Setup flathub remote, remove fedora remote if present
setup-flatpak-repos:
  flatpak remote-add --if-not-exists --system flathub https://flathub.org/repo/flathub.flatpakrepo
  flatpak uninstall --system --noninteractive `flatpak list --all --columns origin,application|grep ^fedora|awk '{print $2}'|xargs`
  flatpak remote-delete --system fedora --force
