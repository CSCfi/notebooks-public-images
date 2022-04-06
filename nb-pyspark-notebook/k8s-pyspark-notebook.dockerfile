FROM docker.io/jupyter/pyspark-notebook

LABEL org.opencontainers.image.authors="CSC Notebooks Team <notebooks-admin@csc.fi>"

USER root

ENV HOME /home/$NB_USER

RUN echo "ssh-client and less from apt" \
    && apt-get update -y \
    && apt-get install -y ssh-client less \
    && apt-get clean -y

# Switch back to jovyan user
USER $NB_USER
