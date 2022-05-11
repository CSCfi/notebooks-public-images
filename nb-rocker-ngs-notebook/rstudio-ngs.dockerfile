FROM rocker/rstudio:4.2.0

ENV PATH=/usr/lib/rstudio-server/bin:$PATH

# add this for working with notebooks
COPY userconf.sh /rocker_scripts/
COPY install_ngs.sh /rocker_scripts/
COPY autodownload_and_configure.sh /etc/cont-init.d/zzz-autodownload-and-configure.sh

RUN /rocker_scripts/install_ngs.sh

RUN /rocker_scripts/install_pandoc.sh

VOLUME /data

EXPOSE 8787

CMD ["/init"]
