
FROM nvidia/cuda:11.0-base-ubuntu20.04

# Install some basic utilities
RUN apt-get update && apt-get install -y \
    curl \
    ca-certificates \
    sudo \
    git \
    bzip2 \
    libx11-6 \
 && rm -rf /var/lib/apt/lists/*

# Install Miniconda and Python 3.8
ENV CONDA_AUTO_UPDATE_CONDA=false
ENV PATH=/home/user/miniconda/bin:$PATH
RUN curl -sLo ~/miniconda.sh https://repo.continuum.io/miniconda/Miniconda3-py38_4.8.3-Linux-x86_64.sh \
 && chmod +x ~/miniconda.sh \
 && ~/miniconda.sh -b -p ~/miniconda \
 && rm ~/miniconda.sh \
 && conda install -y python==3.8.3 \
 && conda clean -ya

# CUDA 11.0-specific steps
RUN conda install -y -c pytorch \
    cudatoolkit=11.0.221 \
    "pytorch=0.4.1=py3.8_cuda11.0.221_cudnn8.0.3_0" \
    "torchvision=0.8.1=py38_cu110" \
 && conda clean -ya

RUN conda install ffmpeg -c conda-forge

RUN pip install -r requirements.txt

RUN apt -y install git nano unzip

# Set the default command to python3
CMD ["python3"]
