.dotfiles
==========

In this repo you will find the packages/applications I use in macOS, along with their configurations.

## Installation

Start by installing brew. Follow the installation instructions [here](https://brew.sh/).

Then follow this list of commands:

```
$ cd  ~/
$ git clone git@github.com:jbernardo95/.dotfiles.git
$ cd .dotfiles
$ brew bundle
```

### Configurations

To setup all the configurations follow these steps:

1. Install [oh my zsh](https://github.com/robbyrussell/oh-my-zsh)
2. Symlink dotfiles: `sh symlink.sh`
3. In *iTerm* go to Preferences > Select `Load preferences from a custom folder or URL` to load from `~/.iterm`
4. Follow application specific configuration guides [here](config)
