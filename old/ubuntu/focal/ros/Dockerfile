FROM ubuntu-local:base-focal

# install ros
RUN . /etc/lsb-release && echo "deb http://mirrors.tuna.tsinghua.edu.cn/ros/ubuntu/ `lsb_release -cs` main" > /etc/apt/sources.list.d/ros-latest.list && \
    apt-key adv --keyserver 'ubuntu@111.231.16.142hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654 && \
    apt update && apt install ros-noetic-desktop-full -y

RUN apt install -y \
        libgoogle-glog-dev \
        libceres-dev \
        liblmdb-dev \
        libgsl-dev \
        libglew-dev \
        libftgl-dev \
        libpcap-dev \
        locate \
        gdb && \
        updatedb && \
        rm -rf /var/lib/apt/lists/*
        
RUN pip3 install --upgrade urllib3==1.26.6 requests conan && \
        conan config set general.revisions_enabled=1 && \
        conan profile new default --detect && \
        conan profile update settings.compiler.libcxx=libstdc++11 default

RUN echo "source /opt/ros/noetic/setup.bash" >> ~/.bashrc
