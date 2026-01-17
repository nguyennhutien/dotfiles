# Secrets Handling

This directory intentionally does **not** store secrets.

## Where secrets live

Secrets are stored outside the repository:

```

\~/.secrets/ ├── projectA.env ├── projectB.env

```

## Encryption

Secrets can be encrypted using `age` and decrypted at runtime.

The dotfiles repo may store:

- encrypted blobs
- templates
- recipient public keys

But never plaintext secrets.

## Usage with direnv

Projects load secrets via:

```bash
load_secret projectA
````

Secrets are scoped per-project and automatically unloaded when leaving the directory.
