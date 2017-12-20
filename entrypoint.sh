#!/bin/bash

/usr/local/bin/yarn --pure-lockfile

exec "$@"
