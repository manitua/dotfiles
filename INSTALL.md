## Nerd Fonts
$ git clone --branch 2.1.0 --depth=1 https://github.com/ryanoasis/nerd-fonts.git
$ cd nerd-fonts && ./install.sh Hack

## Oh My Zsh
$ wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh
$ ./install.sh

## GNU/Linux

### Arch
$ ./bootstrap arch

## Tmux

### Reload TMUX environment so TPM is sourced

```bash
# type this in terminal if tmux is already running
$ tmux source ~/.tmux.conf
```

### Key bindings

`prefix` + <kbd>I</kbd>
- Installs new plugins from GitHub or any other git repository
- Refreshes TMUX environment

`prefix` + <kbd>U</kbd>
- updates plugin(s)

`prefix` + <kbd>alt</kbd> + <kbd>u</kbd>
- remove/uninstall plugins not on the plugin list

## Vim (neovim)

`:PaqInstall`
- to install plugins

### Commands

| Command      | Description                                                                        |
| -------------| ---------------------------------------------------------------------------------- |
| `PaqInstall` | Install all packages listed in your configuration.                                 |
| `PaqUpdate`  | Update all packages already on your system (it won't implicitly install them).     |
| `PaqClean`   | Remove all packages (in Paq's directory) that aren't listed on your configuration. |
| `PaqSync`    | Execute the three operations listed above.                                         |

### Diagnose problems
`:checkhealth`
- check neovims health

```sh
$ sudo npm install -g typescript neovim quicktype yaml-language-server bash-language-server

$ gem install neovim
# fix $PATH, if needed, for `gem` executables
```
