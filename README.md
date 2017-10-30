# Docker Image for EmberJS

This is used for when you want to develop an ember application and do testing as well.

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
# docker run -rm -it -v $(pwd):/app jrock2004/docker-emberjs ember init -n `name or app`
```

### Run the image with existing project

```
# docker run -rm -it -v $(pwd):/app -p 4200:4200 -p 7020:7020 -p 7357:7357 -p 9222:9222 jrock2004/docker-emberjs
```

### Run some tests

```
# docker run -rm -it -v $(pwd):/app -p 4200:4200 -p 7020:7020 -p 7357:7357 -p 9222:9222 jrock2004/docker-emberjs ember test --server
```
