# Modify the sudoers File to Require a Password

By default, sudo might cache the password for a short duration (typically 5-15 minutes). To force sudo to ask for a password every time:

Open the sudoers file using visudo:

```bash
sudo visudo
```

Add or modify the following line to disable password caching:

```bash
Defaults timestamp_timeout=0
```

`timestamp_timeout=0` ensures sudo always prompts for a password.
Alternatively, apply this setting to a specific user (e.g., john):

```bash
Defaults:john timestamp_timeout=0
```
