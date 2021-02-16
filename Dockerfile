FROM pytorch/pytorch:0.4.1-cuda9-cudnn7-devel

RUN apt update && apt install -y --no-install-recommends \
    git \
    nano \
    unzip \
    wget \
    python3-dev \
    python3-pip \
    python3-setuptools
RUN pip install --upgrade pip

RUN apt-get update \
     && apt-get install -y \
        libgl1-mesa-glx \
        libx11-xcb1 \
        libgtk2.0-dev \
     && apt-get clean all \
     && rm -r /var/lib/apt/lists/*

RUN pip install numpy==1.16.2
RUN pip install scipy==1.1.0
RUN pip install tensorboardX==1.2
RUN pip install torch==0.4.1
RUN pip install tqdm==4.15.0
RUN pip install imageio==2.3.0
RUN pip install opencv-python==3.4.4.19
RUN pip install sklearn==0.0
RUN pip install scikit-learn==0.21.3
RUN pip install scipy==1.1.0
RUN pip install matplotlib==3.1.1
RUN pip install ffmpeg-python
RUN pip install imageio-ffmpeg
RUN imageio_download_bin ffmpeg