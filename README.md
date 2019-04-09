# Personal ArchLinux configuration and some Tips&Tricks
<p align="center">
        <img src="https://img.shields.io/badge/Version-0.1-blue.svg">
        <img src="https://img.shields.io/badge/License-GPLv3-yellow.svg">
        <img src="https://img.shields.io/badge/Status-Alpha-red.svg">
</p>

### 1. Install Microcode
For intel processors with grub boot loader:
`sudo pacman -S intel-ucode`
`sudo grub-mkconfig -o /boot/grub/grub.cfg`
For AMD processors install linux-firmware package.

### 2. Install Microcode

For intel processors with grub boot loader:
`sudo pacman -S intel-ucode`
`sudo grub-mkconfig -o /boot/grub/grub.cfg`

For AMD processors install linux-firmware package.

### 3. Install TLP power management system

`pacman -S tlp tlp-rdw`

**ThinkPads require an additional**:

`pacman -S tp_smapi acpi_call`

**ThinkPad notes:**
Refer to "Which kernel module?" for details
You must disable Secure Boot to use the ThinkPad specific packages Service Units
To complete the installation you must enable TLP's services:

`systemctl enable tlp.service`
`systemctl enable tlp-sleep.service`

Using the Radio Device Wizard (tlp-rdw) requires an additional service:

`systemctl enable NetworkManager-dispatcher.service`

You should also mask the following services to avoid conflicts and assure proper operation of TLP's radio device switching options:

`systemctl mask systemd-rfkill.service`
`systemctl mask systemd-rfkill.socket`

### 4. Disable GRUB delay

Add the following to `/etc/default/grub`

**achieve the fastest possible boot**

`GRUB_FORCE_HIDDEN_MENU="true"`

Then put file 31_hold_shift to `/etc/grub.d/`

Download 31_hold_shift https://goo.gl/nac6Kp

Make it executable, and regenerate the grub configuration:
`sudo chmod a+x /etc/grub.d/31_hold_shift`
`sudo grub-mkconfig -o /boot/grub/grub.cfg`

### 5. Remove orphans

`sudo pacman -Rns $(pacman -Qtdq)`

### EXTRA TIPS

**Check for errors**

`sudo systemctl --failed`
`sudo journalctl -p 3 -xb`


