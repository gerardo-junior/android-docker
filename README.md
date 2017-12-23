# The custom image docker for build fiscalize app

| master  | develop  |
| :------------: | :------------: |
| [![Build Status](https://api.travis-ci.org/wikificha/fiscalize.environment.svg?branch=master)](https://travis-ci.org/wikificha/fiscalize.environment)  |  [![Build Status](https://api.travis-ci.org/wikificha/fiscalize.environment.svg?branch=develop)](https://travis-ci.org/wikificha/fiscalize.environment) |

## Come on, do your tests.

```bash
$ docker pull wikificha/fiscalize:stable
```

## How to build

```bash
$ git clone -b master https://github.com/wikificha/fiscalize.environment.git
$ cd fiscalize.environment
$ docker build . -t wikificha/fiscalize:stable
```

