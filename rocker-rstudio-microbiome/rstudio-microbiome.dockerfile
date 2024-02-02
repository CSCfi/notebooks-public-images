FROM rocker/rstudio:4.3.0

ENV PATH=/usr/lib/rstudio-server/bin:$PATH

# add this for working with notebooks
COPY install_microbiome.sh /rocker_scripts/

RUN /rocker_scripts/install_microbiome.sh

RUN /rocker_scripts/install_pandoc.sh

VOLUME /data

EXPOSE 8787

CMD ["/init"]
