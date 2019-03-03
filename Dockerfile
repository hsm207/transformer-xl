FROM continuumio/miniconda:4.5.12

# install pytorch cpu
RUN conda create -y -n pytorch python=3.6 pytorch=0.4.1 -c pytorch

RUN apt-get install unzip vim

WORKDIR /transformer-xl

COPY . /transformer-xl

# only downlaod the wikitext-103 dataset
RUN mkdir -p ./data/wikitext-2; \
    mkdir -p ./data/text8; \
    mkdir -p ./data/enwik8; \
    mkdir -p ./data/penn; \
    mkdir -p ./data/one-billion-words

RUN bash getdata.sh

