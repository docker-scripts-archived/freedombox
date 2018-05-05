#!/bin/bash -x

/usr/lib/freedombox/setup | tee /host/logs/freedombox-setup.log

for script in /usr/lib/freedombox/first-run.d/* ; do
  $script
done
