#!/bin/bash

/usr/bin/yarn --pure-lockfile

adb devices

exec "$@"
