# Use the official image as a parent image.
FROM continuumio/miniconda

WORKDIR /workspace
# Install the conda environment
ADD environment.yml ./
RUN conda env create -f ./environment.yml && conda clean -a
# Make RUN commands use the new environment:
# SHELL ["conda", "run", "-n", "aligners", "/bin/bash", "-c"]

# The code to run when container is started:
ENTRYPOINT ["conda", "run", "-n", "aligners", "python", "align_bwa.py"]