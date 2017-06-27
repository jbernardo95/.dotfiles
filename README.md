.dotfiles
==========

In this repo you will find the packages/applications I use in macOS, along with their configurations.

## Install 

Start by downloading the repo:

```
$ cd  ~/
$ git clone git@github.com:jbernardo95/.dotfiles.git
$ cd .dotfiles
```

### Packages/Applications

To install all the packages and applications:

```
$ brew bundle 
```

Third party applications listed [here](third_party.md) can not be installed automatically, so you need to go and get them by hand. 

### Configurations

To setup all the configurations follow these steps:

1. Symlink dotfiles: `sh symlink.sh`
2. Open Preferences and setup them according to [this](mac_os_config.md) list
3. Open iTerm > Preferences > Select `Load preferences from a custom folder or URL` to load from `~/.iterm`
4. Open Alfred Preferences and setup them according to [this](alfred.md) list
5. Install [oh my zsh](https://github.com/robbyrussell/oh-my-zsh) and [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)
6. Install [Vundle](https://github.com/VundleVim/Vundle.vim), open vim and run `:PluginInstall`
7. Install atom packages `apm install --packages-file atom/package.list`
8. Follow security configurations seteps [here](security.md) 

## Extras

The base `Vagrantfile` I use in my project is available [here](Vagrantfile).
