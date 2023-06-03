# Security Configurations

## macOS 

*macOS* Security configurations are [here](mac_os.md)

## 1Password

Open *1Password* > Preferences and setup the following configurations:

- `Shift + Cmd + L` - Lock 1Password 
- `Shift + Cmd + K` - Show 1Password mini
- Lock after computer is idle for: 1 minute
- Clear clipboard contents after: 30 seconds

## ssh

If it is a new computer generate new ssh keys:

1. Generate keys using `ssh-keygen -t rsa -b 4096 -C "email@example.com"`
2. Add private key to *ssh-agent* `ssh-add -K ~/.ssh/id_rsa`

If old keys are necessary import them from 1Password:

1. Download SSH keys from 1Password to `~/.ssh/id_rsa` (private) and `~/.ssh/id_rsa.pub` (public)
2. Set key files permissions `chmod 600 ~/.ssh/id_rsa` and `chmod 644 ~/.ssh/id_rsa.pub`
3. Add private key to *ssh-agent* `ssh-add -K ~/.ssh/id_rsa`

## gpg

If you want to re-use keys for an existing identity:

1. Download PGP keys from 1Password to `~/public.keys` (public) and `~/private.keys` (private)
2. `gpg --import public.keys`
3. `gpg --import private.keys`
4. `gshred public.key private.key`
5. `rm public.key private.key`

If you want to generate new keys for a new identity, follow instructions on how to do it [here](https://docs.github.com/en/authentication/managing-commit-signature-verification/generating-a-new-gpg-key).
