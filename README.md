# The custom image docker for build fiscalize app [![Docker Repository on Quay](https://quay.io/repository/wikificha/fiscalize/status "Docker Repository on Quay")](https://quay.io/repository/wikificha/fiscalize)
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

### License

Copyright (c) 2017 Wikificha. Released under the MIT license. See [LICENSE](/LICENSE) file for details.