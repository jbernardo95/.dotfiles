# Security Configurations

## macOS 

*macOS* Security configurations are [here](mac_os.md)

## 1Password

Open *1Password* > Settings and setup the following configurations:

- Security > Auto-lock > Lock after computer is idle for: `1 minute`
- Security > Clipboard > Remove copied information and authentication codes after 90 seconds: `On`
- Developer > Use the SSH agent: `On`

## ssh

If it is a new computer generate new ssh key in 1Password.

## gpg

If you want to re-use keys for an existing identity:

1. Download PGP keys from 1Password to `~/public.keys` (public) and `~/private.keys` (private)
2. `gpg --import public.keys`
3. `gpg --import private.keys`
4. `gshred public.key private.key`
5. `rm public.key private.key`

If you want to generate new keys for a new identity, follow instructions on how to do it [here](https://docs.github.com/en/authentication/managing-commit-signature-verification/generating-a-new-gpg-key).
