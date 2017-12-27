#!/bin/bash

if [ -e "$(ipwd)/android/gradlew" ] ; then
    $(pwd)/android/gradlew clean -p $(pwd)/android/;
fi

if [ -n "${EXPO_TOKEN}" ] ; then
    /usr/bin/exp login -t $EXPO_TOKEN
elif [ -n "${EXPO_USERNAME}" ] && [ -n "${EXPO_PASSWORD}" ] ; then
    /usr/bin/exp login -u $EXPO_USERNAME -p $EXPO_PASSWORD
fi

if [ -e "$(pwd)/yarn.lock" ] ; then
    /usr/bin/yarn --pure-lockfile
    /usr/bin/yarn cache clean --force
elif [ -e "$(pwd)/package.json" ] ; then
    /usr/bin/npm install
    /usr/bin/npm cache clean --force
fi

$ANDROID_HOME/platform-tools/adb start-server # Only to get authorization

exec "$@"   
