FROM nvidia/cuda:11.7.1-cudnn8-devel-ubuntu22.04

# 设置非交互式安装
ENV DEBIAN_FRONTEND=noninteractive

# 安装依赖和 Python 3.10
RUN apt-get update && apt-get install -y software-properties-common && \
    add-apt-repository ppa:deadsnakes/ppa && \
    apt-get update && apt-get install -y \
        python3.10 \
        python3.10-venv \
        python3.10-dev \
        curl \
        git \
        ffmpeg \
        libgl1-mesa-glx \
        libglib2.0-0 \
        cmake \
        unzip \
        libegl-dev \
        tzdata \
        openssh-server && \
    curl -sS https://bootstrap.pypa.io/get-pip.py | python3.10 && \
    ln -sf /usr/bin/python3.10 /usr/bin/python && \
    ln -sf /usr/local/bin/pip /usr/bin/pip && \
    rm -rf /var/lib/apt/lists/*

#libegl-dev

# 拷贝 requirements.txt 并安装依赖
COPY requirements.txt /tmp/
RUN pip install --upgrade pip && pip install -r /tmp/requirements.txt

# 设置默认工作目录
WORKDIR /workspace

# 容器启动时默认进入 bash
CMD ["/bin/bash"]
