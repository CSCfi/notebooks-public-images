# Use Rocker RStudio as base for your image
FROM rocker/rstudio:4.3.1

# copy the desired installation script into docker file system, make sure that you have execute rights to the script
COPY install_geospatial.sh /rocker_scripts/

# install the custom packages and system dependencies by running the script
RUN /rocker_scripts/install_geospatial.sh

WORKDIR /home/rstudio/

RUN git clone https://github.com/csc-training/r-spatial-course.git && chown -R rstudio:rstudio /home/rstudio/r-spatial-course && chmod +x /home/rstudio/r-spatial-course/install_packages.sh

RUN wget https://raw.githubusercontent.com/csc-training/geocomputing/master/R/STAC/STAC_CSC_example.Rmd && chown -R rstudio:rstudio STAC_CSC_example.Rmd && chmod +x STAC_CSC_example.Rmd
