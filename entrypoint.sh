#!/bin/bash

yarn --pure-lockfile

exec "$@"
