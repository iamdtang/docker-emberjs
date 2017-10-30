# Docker Image for EmberJS

This is used for when you want to develop an ember application and do testing as well.

![stars](https://img.shields.io/docker/stars/jrock2004/emberjs.svg) ![pulls](https://img.shields.io/docker/pulls/jrock2004/emberjs.svg) ![automated](https://img.shields.io/docker/automated/jrock2004/emberjs.svg) ![automated](https://img.shields.io/docker/build/jrock2004/emberjs.svg)

## Supported tags

- [latest](https://github.com/jrock2004/docker-emberjs/blob/master/Dockerfile)
- [2.16.0](https://github.com/jrock2004/docker-emberjs/blob/2.16.0/Dockerfile)
- [2.12.0](https://github.com/jrock2004/docker-emberjs/blob/2.12.0/Dockerfile)
- [2.10.0](https://github.com/jrock2004/docker-emberjs/blob/2.10.0/Dockerfile)


## Ports

The following ports are being exposed from the base image

- 4200: EmberJS port
- 49153: Live reload port
- 7357: Testing port
- 9222: Test dubugging port

## Examples of use
Here are a few docker commands that help you with using this image

### Create new ember project

```
# docker run -rm -it -v $(pwd):/app jrock2004/emberjs ember init -n `name or app`
```

### Run the image with existing project

```
# docker run -rm -it -v $(pwd):/app -p 4200:4200 -p 49153:49153 -p 7357:7357 -p 9222:9222 jrock2004/emberjs
```

### Run some tests

```
# docker run -rm -it -v $(pwd):/app -p 4200:4200 -p 49153:49153 -p 7357:7357 -p 9222:9222 jrock2004/emberjs ember test --server
```
