# Install Arch linux with Grub, UEFI, encrypted file system and secure boot

## Set the console keyboard layout

```
# localectl list-keymaps
# loadkeys <keymap>
```

## Connect to the Internet (assuming WiFi)

```
# iwctl
[iwd]# device list
[iwd]# station <name> scan
[iwd]# station <name> get-networks
[iwd]# station <name> connect <SSID>
[iwd]# station <name> show
[iwd]# exit
#
```

## Update the system clock

```
# timedatectl set-timezone <zone>
# timedatectl set-ntp true
```

## Partition the disk

```
# lsblk
# gdisk /dev/<device>
Command: o

Command: n
Partition number: 1
First sector: <ENTER>
Last sector: +1024M
Hex code: ef00

Command: n
Partition number: 2
First sector: <ENTER>
Last sector: -50G <-- Leave 50G unallocated for nvme performance operations and stuff
Hex code: 8300

Command: w
```

## Partition

Choose **LVM on LUKS with ext4/xfs** or **LUKS on btrfs**

### LVM on LUKS

Create the LUKS encrypted container

```
# cryptsetup --verbose \
    --key-size 512 \
    --hash sha512 \
    --cipher aes-xts-plain64 \
    --verify-passphrase \
    --use-random \
    --iter-time 5000 \
    luksFormat /dev/nvme0n1p2
```

Open the container

```
# cryptsetup luksOpen /dev/nvme0n1p2 cryptlvm
```

Create physical volume on top of opened LUKS container

```
# pvcreate /dev/mapper/cryptlvm
```

Create volume group and add the previously created physical volume to it

```
# vgcreate vg0 /dev/mapper/cryptlvm
```

Create logical volumes on the volume group

```
# lvcreate -L 16G vg0 -n swap
# lvcreate -L 256G vg0 -n root
# lvcreate -l 100%FREE vg0 -n home
```

Format the partitions (ext4 in this case, change to xfs if preferred)

```
# mkfs.vfat -F32 /dev/nvme0n1p1
# mkfs.ext4 /dev/vg0/root
# mkfs.ext4 /dev/vg0/home
# mkswap /dev/vg0/swap
```

Mount the file system

```
# mount /dev/vg0/root /mnt

# mkdir /mnt/boot
# mount /dev/nvme0n1p1 /mnt/boot

# mkdir /mnt/home
# mount /dev/vg0/home /mnt/home

# swapon /dev/vg0/swap
```

### LUKS on btrfs

Create the LUKS encrypted container

```
# cryptsetup --verbose \
    --key-size 512 \
    --hash sha512 \
    --cipher aes-xts-plain64 \
    --verify-passphrase \
    --use-random \
    --iter-time 5000 \
    luksFormat /dev/nvme0n1p2
```

Open the container

```
# cryptsetup luksOpen /dev/nvme0n1p2 cryptlvm
```

Format the partitions

```
# mkfs.vfat -F32 /dev/nvme0n1p1
# mkfs.btrfs /dev/mapper/cryptlvm
```

Mount **btrfs** partition to create subvolumes

```
# mount /dev/mapper/cryptlvm /mnt
```

Create subvolumes

```
# btrfs subvolume create /mnt/@
# btrfs subvolume create /mnt/@home
# btrfs subvolume create /mnt/@var
# btrfs subvolume create /mnt/@swap
```

Unmount **btrfs** partition

```
# umount /mnt
```

Mount the file system

```
# mount -o noatime,ssd,compress=zstd,space_cache=v2,discard=async,subvol=@ /dev/mapper/cryptlvm /mnt
# mkdir -p /mnt/{boot,home,var,swap}
# mount -o noatime,ssd,compress=zstd,space_cache=v2,discard=async,subvol=@home /dev/mapper/cryptlvm /mnt/home
# mount -o noatime,ssd,compress=zstd,space_cache=v2,discard=async,subvol=@var /dev/mapper/cryptlvm /mnt/var
# mount /dev/nvme0n1p1 /mnt/boot
# mount -o noatime,ssd,space_cache=v2,subvol=@swap /dev/mapper/cryptlvm /mnt/swap
# btrfs filesystem mkswapfile --size 16g --uuid clear /mnt/swap/swapfile
# swapon /mnt/swap/swapfile
```

## Install essential packages

Use `pacstrap` script to install the essential packages

```
# pacstrap /mnt \
    base linux linux-firmware <intel|amd>-ucode grub <grub-btrfs> efibootmgr \
    cryptsetup <lvm2|btrfs-progs> networkmanager network-manager-applet \
    dhcpcd neovim sudo acpid sbctl
```

## Configure `fstab`

Generate an `fstab` file (`-U` for UUID)

```
# genfstab -U -p /mnt >> /mnt/etc/fstab
```

## Chroot

Change root into the new system

```
# arch-chroot /mnt
```

## Time zone

Set the time zone:

```
# ln -sf /usr/share/zoneinfo/Region/City /etc/localtime
```

Run hwclock(8) to generate /etc/adjtime:

```
# hwclock --systohc
```

This command assumes the hardware clock is set to UTC

## Localization

Edit `/etc/locale.gen` and uncomment `en_US.UTF-8 UTF-8` and other needed
locales. Generate the locales by running:

```
# locale-gen
```

Create the locale.conf file, and set the LANG variable accordingly

```
# echo "LANG=en_US.UTF-8" > /etc/locale.conf
```

If you set the console keyboard layout, make the changes persistent in
vconsole.conf

```
echo "KEYMAP=sv-latin1" > /etc/vconsole.conf
```

## Network configuration

Create the hostname file

```
# echo "myhostname" > /etc/hostname
```

Some software may however still read `/etc/hosts` directly. To prevent them
from potentially breaking, hanging or otherwise delaying operation, make sure
they can resolve the local hostname and `localhost` by configuring the hosts
file.

```
127.0.0.1       localhost
::1             localhost
127.0.1.1       myhostname.localdomain myhostname
```

## Configuring mkinitcpio

Add the `encrypt` (and `lvm2`, if used) before `filesystems` hooks to
`/etc/mkinitcpio.conf`

```
HOOKS=(base udev autodetect keyboard keymap modconf block encrypt <lvm2> filesystems fsck)
```

For `btrfs` also update `/etc/mkinitcpio.conf` with following:

```
MODULES=(btrfs)
```

And recreate the initramfs image

```
# mkinitcpio -P
```

## Configuring the boot loader

Execute the following command to install the GRUB EFI application `grubx64.efi`
to `/boot/EFI/GRUB/` and install its modules to `/boot/grub/x86_64-efi/`

```
# grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB
```

In order to unlock the encrypted root partition at boot, the following kernel
parameter needs to be added in file `/etc/default/grub` to `GRUB_CMDLINE_LINUX=""`

```
cryptdevice=UUID=<device-UUID>:cryptlvm root=</dev/vg0/root|/dev/mapper/cryptlvm>
```

The `<device-UUID>` refers to the UUID of `/dev/nvme0n1p2`

Use the `grub-mkconfig` tool to generate `/boot/grub/grub.cfg`

```
# grub-mkconfig -o /boot/grub/grub.cfg
```

## Root password

Set the root password

```
# passwd
```

## Create user

Create user

```
# useradd -G wheel -m -U <user>
```

Set user password

```
# passwd <user>
```

Edit sudoers file and uncomment wheel group i.e. `%wheel ALL=(ALL:ALL) ALL`

```
# EDITOR=nvim visudo
```

## Enable some services

```
# systemctl enable NetworkManager
# systemctl enable acpid
```

## Reboot

You can remove installation USB when system is about to start

```
# exit
# shutdown -r now
```

## Setup network (WiFi)

```
$ nmcli device wifi list
$ nmcli device wifi connect <SSID> --ask
```

## Enable secure boot

Reboot to BIOS and put system in "secure boot setup mode" by deleting all vendor keys
i.e. microsoft builtin keys as we are not planing to dual boot.

Create own keys

```
$ sudo sbctl create-keys
```

Check that Installed is OK (sbctl is installed), Owner GUID exists and Setup Mode is enabled with:

```
$ sudo sbctl status
```

Enroll keys

```
$ sudo sbctl enroll-keys
```

Sign compressed linux kernel referenced by bootloader

```
$ sudo sbctl sign -s /boot/vmlinuz-linux
```

Before signing bootloader EFI binary, reinstall/update GRUB

```
$ sudo grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB \
    --disable-shim-lock --modules="tpm" --recheck
```

Remake GRUB config

```
$ sudo grub-mkconfig -o /boot/grub/grub.cfg
```

Sign bootloader EFI binary

```
$ sudo sbctl sign -s /boot/EFI/GRUB/grubx64.efi
```

Check/verify that both bootloader and kernel are signed

```
$ sudo sbctl list-files
```

Reboot to BIOS and enable secure boot also set BIOS setup password to prevent
BIOS changes, as without it our secure boot setup will be for nothing, and boot
into OS after the change

Verify that Installed is OK (sbctl is installed), Owner GUID exists and Setup Mode is disabled
and Secure Boot enabled

```
$ sudo sbctl status
```

## Install AUR package helper

Paru

```
$ git clone https://aur.archlinux.org/paru.git
$ cd paru
$ makepkg -i
```
