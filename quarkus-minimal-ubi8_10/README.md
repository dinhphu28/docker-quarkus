# QUARKUS MINIMAL UBI8

## Usage

E.g: Dockerfile

```dockerfile
FROM registry.cads.live/cads/base/quarkus/quarkus-minimal-8.10
LABEL org.opencontainers.image.authors="dinhphu.nguyen.20@gmail.com"
ENV TZ=Asia/Ho_Chi_Minh

WORKDIR /deployments/
COPY app/target/*-runner /deployments/application

ENV NATIVE_APP="/deployments/application"

EXPOSE 8088

ENV HTTP_PROXY="http://your.proxy.tld:8080"
ENV HTTPS_PROXY="https://your.proxy.tld:8443"
ENV NO_PROXY="127.0.0.1,localhost,10.8.0.0/24"

ENTRYPOINT ["/opt/dinhphu28/container/native/run/run-native.sh"]
```
