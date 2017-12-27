#!/bin/bash

if [ -e "$(pwd)/android/gradlew" ] ; then
    $(pwd)/android/gradlew clean -p $(pwd)/android/;
fi

if [ -n "${EXPO_TOKEN}" ] ; then
    /usr/bin/exp login -t $EXPO_TOKEN
elif [ -n "${EXPO_USERNAME}" ] && [ -n "${EXPO_PASSWORD}" ] ; then
    /usr/bin/exp login -u $EXPO_USERNAME -p $EXPO_PASSWORD
fi

if [ -e "$(pwd)/yarn.lock" ] ; then
    /usr/bin/yarn --pure-lockfile
elif [ -e "$(pwd)/package.json" ] ; then
    /usr/bin/npm install
fi

$ANDROID_HOME/platform-tools/adb start-server # Only to get authorization

exec "$@"   
