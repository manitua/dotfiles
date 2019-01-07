Nerd Fonts
==========
$ git clone --depth=1 https://github.com/ryanoasis/nerd-fonts.git
$ cd nerd-fonts && ./install.sh Hack

Oh My Zsh
=========
$ wget <URL>
$ ./install.sh

Linux
=====

### Simple Terminal 0.8.1
dnf:
 - fontconfig-devel
 - freetype-devel
 - libX11-devel
 - libXft-devel
 - patch

apt:
 - TODO

Patch:
 - st-scrollback-0.8.diff
 - st-no_bold_colors-0.8.1.diff
 - st-solarized-dark-20180411-041912a.diff

```
#define histsize 2000000
static char *font = "Hack Nerd Font Mono:pixelsize=28:antialias=true:autohint=true";
char *termname = "xterm-256color";
```

### Herbstluftwm 0.7.1
dnf:
 - dmenu
 - dzer2
 - slock
 - glib2-devel
 - gcc-c++
 - libXext-devel

apt:
 - TODO
