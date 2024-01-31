FROM rocker/rstudio:4.3.1

ENV PATH=/usr/lib/rstudio-server/bin:$PATH

# add this for working with notebooks
COPY install_rstudio_teaching.sh /rocker_scripts/

RUN /rocker_scripts/install_rstudio_teaching.sh

RUN /rocker_scripts/install_pandoc.sh

VOLUME /data

EXPOSE 8787

CMD ["/init"]
