FROM  nvidia/cuda:11.4.0-runtime-ubuntu20.04

RUN apt-get update && apt-get install -y \
  wget \
  unzip \
  mysql-client

# Install awscli
RUN apt-get install -y \
  python3-pip \
  python \
  && pip3 install awscli

# Install Bento4
RUN wget https://www.bok.net/Bento4/binaries/Bento4-SDK-1-6-0-639.x86_64-unknown-linux.zip
RUN unzip Bento4-SDK-1-6-0-639.x86_64-unknown-linux.zip
RUN mv Bento4-SDK-1-6-0-639.x86_64-unknown-linux/ /usr/bin/Bento4

# Install NATS
RUN apt-get install -y jq curl
RUN wget https://github.com/nats-io/natscli/releases/download/v0.0.35/nats-0.0.35-amd64.deb
RUN dpkg -i nats-0.0.35-amd64.deb
ENV PATH="/usr/bin/Bento4/bin:${PATH}"

# Install AWS
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
RUN unzip awscliv2.zip
RUN ./aws/install

# Install ffmpeg
RUN DEBIAN_FRONTEND=noninteractive apt install -y --no-install-recommends nvidia-cuda-toolkit
RUN mkdir /root/nvidia/ && cd /root/nvidia/
RUN apt install -y git
RUN git clone https://git.videolan.org/git/ffmpeg/nv-codec-headers.git
RUN cd nv-codec-headers && make install
RUN DEBIAN_FRONTEND=noninteractive apt install -y build-essential yasm cmake libtool libc6 libc6-dev unzip wget libnuma1 libnuma-dev
WORKDIR /root/nvidia/
# RUN git clone https://git.ffmpeg.org/ffmpeg.git ffmpeg/
RUN git clone https://github.com/FFmpeg/FFmpeg.git ffmpeg/
WORKDIR /root/nvidia/ffmpeg/
RUN apt install -y libx264-dev libx265-dev libfdk-aac-dev
RUN ./configure --enable-gpl --enable-version3 --enable-libx264 --enable-libx265 --enable-libfdk-aac --enable-nonfree --enable-cuda-nvcc --enable-libnpp --extra-cflags=-I/usr/local/cuda/include --extra-ldflags=-L/usr/local/cuda/lib64
RUN make -j $(nproc)
RUN make install
# ffmpeg -y -hwaccel cuda -i input.file output.file

WORKDIR /home