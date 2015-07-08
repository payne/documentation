Deploying SCDS for the first time
====================================

If the first time you try and deploy SCDS you aren't able to reach https://brbennet-ld1.linkedin.biz:8443/scds/common/u/img/logos/logo_132x32_2.png like the terminal tells you look in the terminal log.  If you find an error that says ` /export/content/lid does not exist` you'll need to make that directory with the following command.

```bash
sudo mkdir -p /export/content/lid; sudo chown whoami /export/content/lid
```
