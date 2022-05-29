# inspired by 
# https://moduliertersingvogel.de/2016/04/24/fly-me-to-the-stars-interactive-graphs-with-docker-jupyter-and-r/


FROM r-base:4.1.0

LABEL maintainer="julianselke@web.de"

ENV LANG="en_US.UTF-8"                                                                   \
    LANGUAGE="en_US:en"                                                                  \
    LC_ALL="en_US.UTF-8"                                                                 \
    DEBIAN_FRONTEND="noninteractive"                                                     \
    TZ="America/Bogota"                                                                  \
    PATH="/root/miniconda3/bin:/jupyter_dir/jupyter_env/bin:${PATH}"

RUN locale-gen en_US.UTF-8                                                               \ 
    && apt-get update                                                                    \
    && apt-get install -y                                                                \
       sudo                                                                              \
       vim                                                                               \
       wget                                                                              \
       cmake                                                                             \
       unzip                                                                             \
       libxml2                                                                           \
       libxml2-dev                                                                       \
       libfontconfig1-dev                                                                \
       libgsl-dev                                                                        \
       libcurl4-openssl-dev                                                              \
       libssl-dev                                                                        \
       python3-pip                                                                       \
       python3-dev                                                                       \
       fastp                                                                             \
       bzip2                                                                             \
       libzmq3-dev                                                                       \
       libcurl4-openssl-dev                                                              \
       libssl-dev                                                                        \
       inkscape                                                                          \
       pandoc                                                                            \
       texlive-latex-base                                                                \
       texlive-latex-extra                                                               \
    && pip3 install --upgrade pip                                                        \
    && pip3 install virtualenv                                                           \
    && mkdir jupyter_dir                                                                 \
    && cd jupyter_dir                                                                    \
    && virtualenv jupyter_env                                                            \
    && . jupyter_env/bin/activate                                                        \
    && pip3 install jupyter                                                              \ 
    && pip install rpy2                                                                  \
    && pip install numpy                                                                 \
    && pip install pandas

RUN Rscript -e "install.packages('BiocManager', repos='https://stat.ethz.ch/CRAN/')"     \
    && Rscript -e "BiocManager::install('Rhdf5lib')"                                     \
    && Rscript -e "BiocManager::install('ggtree')"                                       \
    && Rscript -e "BiocManager::install('philr')"                                        \
    && Rscript -e "install.packages('digest', repos='https://stat.ethz.ch/CRAN/')"       \
    && Rscript -e "install.packages('uuid', repos='https://stat.ethz.ch/CRAN/')"         \
    && Rscript -e "install.packages('jsonlite', repos='https://stat.ethz.ch/CRAN/')"     \
    && Rscript -e "install.packages('base64enc', repos='https://stat.ethz.ch/CRAN/')"    \
    && Rscript -e "install.packages('evaluate', repos='https://stat.ethz.ch/CRAN/')"     \
    && Rscript -e "install.packages('stringr', repos='https://stat.ethz.ch/CRAN/')"      \
    && Rscript -e "install.packages('rzmq', repos='https://stat.ethz.ch/CRAN/')"         \
    && Rscript -e "install.packages('IRdisplay', repos='https://stat.ethz.ch/CRAN/')"    \
    && Rscript -e "install.packages('IRkernel', repos='https://stat.ethz.ch/CRAN/')"     \
    && Rscript -e "IRkernel::installspec()"                                              \
    && Rscript -e "install.packages('repr', repos='https://stat.ethz.ch/CRAN/')"         \
    && Rscript -e "install.packages('devtools', repos='https://stat.ethz.ch/CRAN/')"     \
    && Rscript -e "install.packages('reactable', repos='https://stat.ethz.ch/CRAN/')"    \
    && Rscript -e "devtools::install_github('zac-garland/zgtools')"                      \
    && Rscript -e "devtools::install_github('ggloor/ALDEx_bioc')"                        \
    && Rscript -e "install.packages('knitr', repos='https://stat.ethz.ch/CRAN/')"        \
    && Rscript -e "install.packages('kableExtra', repos='https://stat.ethz.ch/CRAN/')"   \
    && Rscript -e "install.packages('xml2', repos='https://stat.ethz.ch/CRAN/')"         \
    && Rscript -e "install.packages('rvest', repos='https://stat.ethz.ch/CRAN/')"        \
    && Rscript -e "install.packages('svglite', repos='https://stat.ethz.ch/CRAN/')"      \
    && Rscript -e "install.packages('kableExtra', repos='https://stat.ethz.ch/CRAN/')"   \
    && Rscript -e "install.packages('ggplot2', repos='https://stat.ethz.ch/CRAN/')"      \
    && Rscript -e "install.packages('aplot', repos='https://stat.ethz.ch/CRAN/')"        \
    && Rscript -e "install.packages('dplyr', repos='https://stat.ethz.ch/CRAN/')"        \
    && Rscript -e "install.packages('vegan', repos='https://stat.ethz.ch/CRAN/')"        \
    && Rscript -e "install.packages('reshape2', repos='https://stat.ethz.ch/CRAN/')"     \
    && Rscript -e "install.packages('phytools', repos='https://stat.ethz.ch/CRAN/')"     \
    && Rscript -e "install.packages('ggsci', repos='https://stat.ethz.ch/CRAN/')"        \
    && Rscript -e "install.packages('knitr', repos='https://stat.ethz.ch/CRAN/')"        \
    && Rscript -e "install.packages('kableExtra', repos='https://stat.ethz.ch/CRAN/')"   \
    && Rscript -e "install.packages('xml2', repos='https://stat.ethz.ch/CRAN/')"         \
    && Rscript -e "install.packages('rvest', repos='https://stat.ethz.ch/CRAN/')"        \
    && Rscript -e "install.packages('svglite', repos='https://stat.ethz.ch/CRAN/')"      \
    && Rscript -e "BiocManager::install('DirichletMultinomial')"                         \
    && Rscript -e "BiocManager::install('mia')"                                          \
    && Rscript -e "BiocManager::install('phyloseq')"                                     \
    && Rscript -e "BiocManager::install('microbiome')"                                   \
    && Rscript -e "BiocManager::install('metagenomeSeq')"                                \
    && Rscript -e "install.packages('multcompView', repos='https://stat.ethz.ch/CRAN/')" \
    && Rscript -e "install.packages('ggdendro', repos='https://stat.ethz.ch/CRAN/')"     \
    && Rscript -e "install.packages('reshape', repos='https://stat.ethz.ch/CRAN/')"      \
    && Rscript -e "install.packages('revealjs', repos='https://stat.ethz.ch/CRAN/')"     \
    && Rscript -e "install.packages('corrplot', repos='https://stat.ethz.ch/CRAN/')"     \
    && Rscript -e "install.packages('onewaytests', repos='https://stat.ethz.ch/CRAN/')"  \
    && Rscript -e "install.packages('tidyr', repos='https://stat.ethz.ch/CRAN/')"        \
    && Rscript -e "install.packages('ape', repos='https://stat.ethz.ch/CRAN/')"          \
    && Rscript -e "install.packages('glmnet', repos='https://stat.ethz.ch/CRAN/')"       \
    && Rscript -e "install.packages('ggpmisc', repos='https://stat.ethz.ch/CRAN/')"      \
    && Rscript -e "install.packages('cluster', repos='https://stat.ethz.ch/CRAN/')"      \
    && Rscript -e "install.packages('Rtsne', repos='https://stat.ethz.ch/CRAN/')"        \
    && Rscript -e "install.packages('zgtools', repos='https://stat.ethz.ch/CRAN/')"      \
    && Rscript -e "install.packages('iNEXT', repos='https://stat.ethz.ch/CRAN/')"        \
    && Rscript -e "install.packages('ALDEx2', repos='https://stat.ethz.ch/CRAN/')"       \
    && Rscript -e "install.packages('plotly', repos='https://stat.ethz.ch/CRAN/')"       \
    && Rscript -e "install.packages('ggfortify', repos='https://stat.ethz.ch/CRAN/')"    \
    && Rscript -e "install.packages('ggthemes', repos='https://stat.ethz.ch/CRAN/')"

RUN wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh           \
    && mkdir .conda                                                                      \
    && bash Miniconda3-latest-Linux-x86_64.sh -b                                         \
    && wget https://data.qiime2.org/distro/core/qiime2-2022.2-py38-linux-conda.yml       \
    && conda env create -n qiime2-2022.2 --file qiime2-2022.2-py38-linux-conda.yml

WORKDIR /root/biommar

EXPOSE 8889

CMD ["bash"]
