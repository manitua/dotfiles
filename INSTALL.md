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

## Vim (nvim)

`:PlugInstall`
- to install plugins

### Commands

| Command                             | Description                                                        |
| ----------------------------------- | ------------------------------------------------------------------ |
| `PlugInstall [name ...] [#threads]` | Install plugins                                                    |
| `PlugUpdate [name ...] [#threads]`  | Install or update plugins                                          |
| `PlugClean[!]`                      | Remove unlisted plugins (bang version will clean without prompt)   |
| `PlugUpgrade`                       | Upgrade vim-plug itself                                            |
| `PlugStatus`                        | Check the status of plugins                                        |
| `PlugDiff`                          | Examine changes from the previous update and the pending changes   |
| `PlugSnapshot[!] [output path]`     | Generate script for restoring the current snapshot of the plugins  |

### Diagnose problems
`:checkhealth`
- check neovims health

```sh
$ sudo npm install -g typescript neovim

$ gem install neovim
# fix $PATH, if needed, for `gem` executables
```
