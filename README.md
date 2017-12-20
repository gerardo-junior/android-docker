# The custom image docker for build fiscalize app (android)

## Come on, do your tests.

```bash
$ docker pull wikificha/fiscalize.environment:stable
```

## How to build

```bash
$ git clone -b master https://github.com/wikificha/fiscalize.environment.git
$ cd fiscalize.environment
$ docker build . -t wikificha/fiscalize:stable
```

