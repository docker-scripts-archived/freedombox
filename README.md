# Minimal Debian container

## Installation

  - First install `ds`: https://github.com/docker-scripts/ds#installation

  - Then get the scripts from github: `ds pull debian`

  - Create a directory for the container: `ds init debian @debian1`

  - Fix the settings: `cd /var/ds/debian1/ ; vim settings.sh`

  - Build image, create the container and configure it: `ds make`

## Other commands

```
ds stop
ds start
ds shell
ds help
```
