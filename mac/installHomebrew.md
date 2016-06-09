Install Homebrew
=================

A handy package manager that makes it easy to get stuff on the command line

1. Run this command

  ```bash
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  ```

2. This will put a bunch of crap into `/usr/local`
3. Each thing you install with brew will add a new folder to `/usr/local` and then symlink the binary to `/usr/local/bin`

If things are being strange and homebrew is breaking all the time, try uninstalling and then reinstalling it.

```bash
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/uninstall)"
```
