FROM rocker/ropensci

LABEL MAINTAINER "CSC Notebooks Team <notebooks-admin@csc.fi>"

USER root

RUN echo "ssh-client and less from apt" \
    && apt-get update -y\
    && apt-get install -y ssh-client less \
    && apt-get clean -y

USER rstudio
