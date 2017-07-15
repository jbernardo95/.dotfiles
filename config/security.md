# Security Configurations

## macOS 

*macOS* Security configurations are [here](mac_os.md)

## Passwords

*1Password* configurations are [here](1password.md)

## SSH

1. Download SSH keys from 1Password to `~/.ssh/id_rsa` (private) and `~/.ssh/id_rsa.pub` (public)
2. Set key files permissions `chmod 600 ~/.ssh/id_rsa` and `chmod 644 ~/.ssh/id_rsa.pub`
3. Add private key to *ssh-agent* `ssh-add -K ~/.ssh/id_rsa`

## GPG

Import GPG keys from Keybase: 

1. Login to Keybase app
2. `keybase pgp export | gpg --import`
3. `keybase pgp export --secret | gpg --allow-secret-key-import --import`
