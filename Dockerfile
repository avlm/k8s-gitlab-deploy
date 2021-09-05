FROM bitnami/kubectl:1.20-debian-10

USER root

RUN apt-get update && \
    apt-get -y install gettext-base

USER 1001
