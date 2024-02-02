#!/bin/bash

set -e

# always set this for scripts but don't declare as ENV..
export DEBIAN_FRONTEND=noninteractive

apt-get update -qq \
  && apt-get install -y --no-install-recommends \
    gdal-bin \
    lbzip2 \
    build-essential \
    libglpk40 \
    libfftw3-dev \
    libgdal-dev \
    libgeos-dev \
    libgsl0-dev \
    libgl1-mesa-dev \
    libglu1-mesa-dev \
    libhdf4-alt-dev \
    libhdf5-dev \
    libjq-dev \
    libpq-dev \
    libproj-dev \
    libprotobuf-dev \
    libnetcdf-dev \
    libsqlite3-dev \
    libssl-dev \
    libudunits2-dev \
    lsb-release \
    netcdf-bin \
    postgis \
    protobuf-compiler \
    sqlite3 \
    tk-dev \
    unixodbc-dev \
    vim \
    nano \
    gawk \
    wget \
    git \
    whois \
    libmagick++-dev \
    gdebi-core

echo 'export PATH=/opt/conda/bin:$PATH' > /etc/profile.d/conda.sh
wget https://repo.anaconda.com/miniconda/Miniconda2-latest-Linux-x86_64.sh  -O ~/anaconda.sh
/bin/bash ~/anaconda.sh -b -p /opt/conda
rm ~/anaconda.sh
export PATH=$PATH:/opt/conda/bin
conda install -c conda-forge tbb

## Somehow foreign is messed up on CRAN between 2020-04-25 -- 2020-05-0?
##install2.r --error --skipinstalled --repo https://mran.microsoft.com/snapshot/2020-04-24 foreign

install2.r --error --skipinstalled \
Rcpp  \
rmarkdown \
markdown \
cluster  \
factoextra  \
RColorBrewer  \
DT  \
plotly  \
rgl  \
forcats  \
purrr  \
readr  \
tidyr  \
tibble  \
tidyverse  \
zCompositions  \
truncnorm  \
NADA  \
survival  \
biclust  \
colorspace  \
grid  \
MASS  \
cobiclust  \
reticulate  \
reshape2  \
ape  \
pheatmap  \
ecodist  \
stringr  \
vegan  \
lattice  \
permute  \
ggsignif  \
patchwork  \
knitr  \
dplyr  \
ggraph  \
ggplot2  \
stats4  \
matrixStats  \
stats  \
graphics  \
grDevices  \
utils  \
datasets  \
methods  \
base  \
Seurat \
devtools  \
BiocManager

R  -e "BiocManager::install(c('dada2', 'bluster', 'sechm', 'ggtree','BiocStyle', 'rebook', 'MultiAssayExperiment', 'Biostrings', 'XVector', 'SingleCellExperiment', 'SummarizedExperiment', 'Biobase', 'GenomicRanges', 'GenomeInfoDb', 'IRanges', 'S4Vectors', 'BiocGenerics', 'MatrixGenerics', 'mia','miaViz','miaSim','TreeSummarizedExperiment','microbiomeDataSets','curatedMetagenomicData','microbiome','phyloseq','ALDEx2','ANCOMBC','Maaslin2','MOFA2','philr','scater','scuttle','scran','tidySummarizedExperiment','lasy/alto','DESeq2','apeglm'))"

R  -e "install.packages('ggord', repos = c(fawda123 = 'https://fawda123.r-universe.dev',CRAN = 'https://cloud.r-project.org'))"
R  -e "devtools::install_github('microbiome/miaTime')"

#R  -e "BiocManager::install('DOSE')"
#R  -e "install.packages('Seurat',version = '4.1.0')"
#R  -e "devtools::install_github('RBigData/pbdZMQ')"
#R  -e "remotes::install_git('https://github.com/ropengov/digitransit')"
#R  -e "devtools::install_github('ropengov/openthl')"


rm -r /tmp/downloaded_packages
