#!/bin/bash

mkdir data
mkdir raw_data

cp ./Eunicea_spp_Microbiome_Analysis-main/* .

rm Eunicea_spp_Microbiome_Analysis-main.zip
rm -rf Eunicea_spp_Microbiome_Analysis-main

# build container image from Dockerfile
podman build --no-cache --rm --file ./Dockerfile --tag biommar:0

# create container from built image
podman create -t -p 33333:8889 --name biommar -v "$(pwd)":/root/biommar/ localhost/biommar:0 \
  bin/bash -c "/jupyter_dir/jupyter_env/bin/jupyter-notebook --ip 0.0.0.0 --no-browser --port 8889 --allow-root --NotebookApp.token='noclave'"
  
# start container
podman start biommar
