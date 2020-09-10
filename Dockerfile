# Use the official image as a parent image.
FROM continuumio/miniconda

WORKDIR /workspace

# Install the conda environment
ADD environment.yml ./
RUN conda env create -f ./environment.yml && conda clean -a

# Add conda installation dir to PATH (instead of doing 'conda activate')
# ENV PATH /opt/conda/envs/aligners/bin:$PATH

# Dump the details of the installed packages to a file for posterity
# RUN conda env export --name aligners > aligners.yml

RUN echo "conda activate aligners" >> /root/.bashrc
