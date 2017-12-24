#!/bin/bash

if [ -e "$(pwd)/android/gradlew" ] ; then
    $(pwd)/android/gradlew clean -p $(pwd)/android/;
fi

if [ ! -z $EXPO_TOKEN ];then
    /usr/bin/exp login -t $EXPO_TOKEN
elif [[( ! -z $EXPO_USERNAME ) && ( ! -z $EXPO_PASSWORD )]];then
    /usr/bin/exp login -u $EXPO_USERNAME -p $EXPO_PASSWORD
fi

/usr/bin/yarn --pure-lockfile

$ANDROID_HOME/platform-tools/adb start-server # Only to get authorization

exec "$@"   