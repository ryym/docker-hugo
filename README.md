A lightweight Docker image hosting [Hugo](https://gohugo.io/) on [alpine][docker-alpine] image.

[docker-alpine]: https://hub.docker.com/_/alpine

## Usage example

Build:

```bash
docker run --rm -v `pwd`:/site -w /site ryym/hugo hugo
```

Develop:

```bash
docker run --rm -v `pwd`:/site -w /site -p 1313:1313 ryym/hugo hugo serve --bind=0.0.0.0
```
