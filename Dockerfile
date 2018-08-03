include(stretch)

### install freedombox
RUN DEBIAN_FRONTEND=noninteractive \
        apt install --yes freedombox-setup
