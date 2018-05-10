#!/bin/bash -x

DEBIAN_FRONTEND=noninteractive \
               apt install -y $(plinth --list-dependencies)
