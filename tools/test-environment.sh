#!/bin/bash
set -ex

printf '>> Checking if everything is installed... ';

if [ ! -e '/usr/bin/git' ]; then echo 'git is not installed'; exit 1; fi
if [ ! -e '/usr/local/bin/node' ] || [ ! -e '/usr/local/bin/nodejs' ]; then echo 'nodejs is not installed'; exit 1; fi
if [ ! -e '/usr/local/bin/npm' ]; then echo 'npm is not configured'; exit 1; fi
if [ ! -e '/usr/local/bin/yarn' ]; then echo 'yarn is not installed'; exit 1; fi
if [ ! -e '/usr/local/bin/exp' ]; then echo 'expo is not installed'; exit 1; fi
if [ ! -e '/usr/local/bin/react-native' ]; then echo 'react-native is not installed'; exit 1; fi

if [ ! -e "${ANDROID_HOME}/tools/bin/sdkmanager" ]; then echo 'sdkmanager not not found'; exit 1; fi
if [ ! -e "${ANDROID_HOME}/platform-tools/adb" ]; then echo 'adb not not found'; exit 1; fi

echo '[OK]';

echo '>> Cloning the project...';

git clone -b master https://github.com/wikificha/fiscalize /tmp/fiscalize;
cd /tmp/fiscalize;

echo '>> Installing the project dependencies...';

if [ -e "$(pwd)/yarn.lock" ]; then
    /usr/local/bin/yarn install --pure-lockfile;
elif [ -e "$(pwd)/package.json" ]; then
    /usr/local/bin/npm install;
fi

printf '>> Running build tests... ';

if [ ! -d "$(pwd)/node_modules" ] || [ -e "$(pwd)/yarn-error.log" ] || [ -e "$(pwd)/npm-debug.log" ]; then echo 'package manager is not working'; exit 1; fi

"${ANDROID_HOME}"/platform-tools/adb start-server

printf '[OK]\n';

echo '>> Everything seems Ok';
exit 0;