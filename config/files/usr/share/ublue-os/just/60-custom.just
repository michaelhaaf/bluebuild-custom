import '100-bling.just'

# Create custom CLI container with same hostname as host
distrobox-cli:
  distrobox create --image ghcr.io/michaelhaaf/ublue-cli:latest -n cli -Y --init-hooks '"$(uname -n)" > /etc/hostname'`

# https://github.com/bsherman/ublue-custom/blob/main/usr/share/ublue-os/just/60-custom.just#L5C1-L9C48
# Setup flathub remote, remove fedora remote if present
setup-flatpak-repos:
  flatpak remote-add --if-not-exists --system flathub https://flathub.org/repo/flathub.flatpakrepo
  flatpak uninstall --system --noninteractive `flatpak list --all --columns origin,application|grep ^fedora|awk '{print $2}'|xargs`
  flatpak remote-delete --system fedora --force

# Start mullvad login sequence and apply prefered parameters
setup-mullvad:
  mullvad account login
  echo "Applying default mullvad policies..."
  set -v
  mullvad relay set tunnel-protocol wireguard
  mullvad tunnel set wireguard --rotation-interval 72
  mullvad dns set default --block-ads --block-trackers --block-malware --block-gambling
  mullvad status -v
  set +v
