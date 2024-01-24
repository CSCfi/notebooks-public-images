FROM rocker/rstudio:4.3.2

ENV PATH=/usr/lib/rstudio-server/bin:$PATH

# add this for working with notebooks
COPY install_scrna.sh /rocker_scripts/

RUN /rocker_scripts/install_scrna.sh

RUN /rocker_scripts/install_pandoc.sh

VOLUME /data

EXPOSE 8787

CMD ["/init"]
