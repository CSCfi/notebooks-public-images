FROM jupyter/minimal-notebook

LABEL MAINTAINER "CSC Notebooks Team <notebooks-admin@csc.fi>"

USER root

RUN test -f /bin/env || ln -s /usr/bin/env /bin/env

ENV HOME /home/$NB_USER

RUN echo "ssh-client and less from apt" \
    && apt-get update -y\
    && apt-get install -y ssh-client less \
    && apt-get clean -y

# Switch back to jovyan user
USER $NB_USER
