FROM rocker/ropensci

LABEL org.opencontainers.image.authors="CSC Notebooks Team <notebooks-admin@csc.fi>"

USER root

RUN echo "deb http://security.debian.org/debian-security bullseye-security main contrib non-free" > /etc/apt/sources.list

RUN echo "ssh-client and less from apt" \
    && apt-get update -y\
    && apt-get install -y ssh-client less \
    && apt-get clean -y

USER rstudio
