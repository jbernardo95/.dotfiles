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

### Configurations

To setup all the configurations follow these steps:

1. Symlink dotfiles: `sh symlink.sh`
2. Install [oh my zsh](https://github.com/robbyrussell/oh-my-zsh)
3. In *iTerm* go to Preferences > Select `Load preferences from a custom folder or URL` to load from `~/.iterm`
4. Follow application specific configuration guides [here](config)
