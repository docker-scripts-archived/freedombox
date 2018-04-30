Freedombox
======

Docker scripts that install and run Freedombox in a container.

## Install

  - First install `ds` and `wsproxy`:
     + https://github.com/docker-scripts/ds#installation
     + https://github.com/docker-scripts/wsproxy#installation

  - Then get the freedombox scripts from github: `ds pull freedombox`

  - Create a directory for the freedombox container: `ds init freedombox @freedombox1`

  - Fix the settings:
    ```
    cd /var/ds/freedombox1/
    vim settings.sh
    ds info
    ```

  - Create the container and install freedombox: `ds make`

    *Note:* This will pull the image from DockerHub. To build the
    image yourself use `ds build` first, however this is usually
    slower.


## Access the website

If the domain is a real one, tell `wsproxy` to get a free
letsencrypt.org SSL certificate for it:
```
ds wsproxy ssl-cert --test
ds wsproxy ssl-cert
```

If the domain is not a real one, add to `/etc/hosts` the line
`127.0.0.1 freedombox.example.org`

Now you can access the website at: https://freedombox.example.org


## Other commands

```
ds shell
ds stop
ds start
ds help
```

## Backup and restore

```
ds backup
ds backup +data
ds restore backup-file.tgz
```

