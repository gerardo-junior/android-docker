#!/bin/bash

yarn --pure-lockfile

adb devices

exec "$@"
