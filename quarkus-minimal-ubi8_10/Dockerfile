FROM registry.access.redhat.com/ubi8/ubi-minimal:8.10
LABEL org.opencontainers.image.authors="dinhphu.nguyen.20@gmail.com"

ENV DINHPHU28_CONTAINER_RUN_MODULE="/opt/dinhphu28/container/native/run"
ENV NATIVE_APP="/deployments/application"

ADD run ${DINHPHU28_CONTAINER_RUN_MODULE}
