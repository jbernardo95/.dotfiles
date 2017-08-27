# Security Configurations

## macOS 

*macOS* Security configurations are [here](mac_os.md)

## Passwords

*1Password* configurations are [here](1password.md)

## SSH

Import key from 1Password:

1. Download SSH keys from 1Password to `~/.ssh/id_rsa` (private) and `~/.ssh/id_rsa.pub` (public)
2. Set key files permissions `chmod 600 ~/.ssh/id_rsa` and `chmod 644 ~/.ssh/id_rsa.pub`
3. Add private key to *ssh-agent* `ssh-add -K ~/.ssh/id_rsa`

## GPG

Import key from 1Password:

1. Download PGP keys from 1Password to `~/private.key` (private) and `~/public.key` (public)
2. `gpg --import public.key`
3. `gpg --allow-secret-key-import --import private.key`
4. `rm public.key private.key`
