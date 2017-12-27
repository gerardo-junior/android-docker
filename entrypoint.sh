#!/bin/bash

if [ -e "$(pwd)/android/gradlew" ] ; then
    $(pwd)/android/gradlew clean -p $(pwd)/android/;
fi

if [ -n "${EXPO_TOKEN}" ] ; then
    /usr/local/bin/exp login -t $EXPO_TOKEN
elif [ -n "${EXPO_USERNAME}" ] && [ -n "${EXPO_PASSWORD}" ] ; then
    /usr/local/bin/exp login -u $EXPO_USERNAME -p $EXPO_PASSWORD
fi

if [ -e "$(pwd)/yarn.lock" ] ; then
    /usr/local/bin/yarn install --pure-lockfile
    /usr/local/bin/yarn cache clean --force
elif [ -e "$(pwd)/package.json" ] ; then
    /usr/local/bin/npm install
    /usr/local/bin/npm cache clean --force
fi

$ANDROID_HOME/platform-tools/adb start-server # Only to get authorization

exec "$@"