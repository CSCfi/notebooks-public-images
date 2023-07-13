# Use Rocker RStudio as base for your image
FROM rocker/rstudio:4.2.0

# copy the desired installation script into docker file system, make sure that you have execute rights to the script
COPY install_geospatial.sh /rocker_scripts/

# install the custom packages and system dependencies by running the script
RUN /rocker_scripts/install_geospatial.sh

RUN git clone --branch 2023_course https://github.com/csc-training/r-spatial-course.git /home/rstudio/r-spatial-course && chown -R rstudio:rstudio /home/rstudio/r-spatial-course
