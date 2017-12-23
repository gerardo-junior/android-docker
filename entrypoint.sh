#!/bin/bash

/usr/bin/yarn --pure-lockfile

$ANDROID_HOME/platform-tools/adb devices # Only to get authorization

exec "$@"
