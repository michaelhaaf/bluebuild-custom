# michaelhaaf's Custom Immutable Images

**NOTE**: This used to be a fork of the [wayblueorg/wayblue](https://github.com/wayblueorg/wayblue) repository. It is now more-loosely based on the general [BlueBuild](https://blue-build.org) ecosystem. This fork includes testing/unstable/opinionated changes from upstream for my personal use cases.

## What
For more info, check out the [BlueBuild homepage](https://blue-build.org/) and the [blue-build CLI](https://github.com/blue-build/cli)

(From [wayblueorg](https://github.com/wayblueorg/wayblue)) Changes and decisions in the images:
- Set saner SDDM defaults
- Set saner wf-shell defaults
- Set saner waybar defaults (coming soon)
- Add a reasonable suite of tools that are needed to have a working desktop with a wayland compositor 
- Build in a minimally opinionated config for each compositor and tools that works out of the box

My own changes
- Packages I like as well as some of the setup steps.

## Customization

(From [wayblueorg](https://github.com/wayblueorg/wayblue): If you want to add your own customizations on top of wayblue, you are advised strongly against forking. Instead, create a repo for your own image by using the [BlueBuild template](https://github.com/blue-build/template), then change your `base-image` to a wayblue image. This will allow you to apply your customizations to wayblue in a concise and maintainable way, without the need to constantly sync with upstream. 

For more info on uBlue, check out the [uBlue homepage](https://universal-blue.org/) and the [main uBlue repo](https://github.com/ublue-os/main/)

## Installation

### Maintained Images
> **Warning**
> [This is an experimental feature](https://www.fedoraproject.org/wiki/Changes/OstreeNativeContainerStable) and should not be used in production, try it in a VM for a while!

- sway
- hyprland

### Rebasing

To rebase an existing Silverblue/Kinoite installation to the latest build:

- First rebase to the unsigned image, to get the proper signing keys and policies installed:
  ```
  rpm-ostree rebase ostree-unverified-registry:ghcr.io/michaelhaaf/$IMAGE_NAME:latest
  ```
- Reboot to complete the rebase:
  ```
  systemctl reboot
  ```
- Then rebase to the signed image, like so:
  ```
  rpm-ostree rebase ostree-image-signed:docker://ghcr.io/michaelhaaf/$IMAGE_NAME:latest
  ```
- Reboot again to complete the installation
  ```
  systemctl reboot
  ```
  
### Post-install

#### Nvidia
If you are using an nvidia image, run this after installation:

```
rpm-ostree kargs \
    --append=rd.driver.blacklist=nouveau \
    --append=modprobe.blacklist=nouveau \
    --append=nvidia-drm.modeset=1
```
