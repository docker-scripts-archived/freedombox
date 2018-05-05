# FreedomBox in a Container

Docker scripts that install and run Freedombox in a container.

## Installation

  - First install `ds` and `wsproxy`:
     + https://github.com/docker-scripts/ds#installation
     + https://github.com/docker-scripts/wsproxy#installation

  - Then get the scripts from github: `ds pull freedombox`

  - Create a directory for the container: `ds init freedombox @freedombox`

  - Fix the settings: `cd /var/ds/freedombox/ ; vim settings.sh`

  - Build image, create the container and configure it: `ds make`

## Access the website

  - Add the domain of freedombox to `wsproxy`: `ds wsproxy add`

  - If the domain is a real one, tell `wsproxy` to get a free
    letsencrypt.org SSL certificate for it: `ds wsproxy ssl-cert`

  - If the domain is not a real one, add to `/etc/hosts` the line:
    `127.0.0.1 freedombox.example.org`

  - Now you can access the website at: https://freedombox.example.org

## Maintenance

    ```
    ds stop
    ds start
    ds shell
    ds help

    # To-Do
    ds backup
    ds restore
    ds remake

    ds update
    ds upgrade
    ```
