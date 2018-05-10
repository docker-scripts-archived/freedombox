# FreedomBox in a Container

Docker scripts that install and run Freedombox in a container.

## Installation

  - First install `ds` and `wsproxy`:
     + https://github.com/docker-scripts/ds#installation
     + https://github.com/docker-scripts/wsproxy#installation

  - Then get the scripts from github: `ds pull freedombox dev`

  - Create a directory for the container: `ds init freedombox-dev @fbdev`

  - Fix the settings: `cd /var/ds/fbdev/ ; vim settings.sh`

  - Build image, create the container and configure it: `ds make`

## Access the website

  - Add the domain of freedombox to `wsproxy`: `ds wsproxy add`

  - Add to `/etc/hosts` the line: `127.0.0.1 fbdev.example.org`

  - Now you can access the website at: https://fbdev.example.org

  - You also need to make a `ds restart` in order for it to work
    normally.

## Maintenance

    ```
    ds restart
    ds shell
    ds help

    ds setup
    ds setup install
    ds inject install-dependencies.sh
    ```
