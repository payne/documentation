Create Local Stork Command
===========================

To develop emails you need to use the stork admin tool.  The script for it is buried in the network emails folder.  To make it easier to access do this add the following to `~/.bashrc` in your linux box

```bash
  alias stork="sh $LEOHOME/content/static/tl/emails/dev_tools/stork-local-dev.sh" #Local stork
```

**Note:** Don't symlink the script to your $PATH.  It often gets changed by the stork team and if you symlink it and the script gets updated your script will point to the wrong version.