ARG DOCKER_REGISTRY=""
FROM ${DOCKER_REGISTRY}/base/ubuntu/jammy:v1.3

# install ros
RUN curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key  -o /usr/share/keyrings/ros-archive-keyring.gpg && \
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] https://mirrors.aliyun.com/ros2/ubuntu jammy main" | tee /etc/apt/sources.list.d/ros2.list > /dev/null && \
    apt update && apt install ros-humble-desktop -y

RUN apt install -y \
        ros-humble-rmw-cyclonedds-cpp \
        python3-colcon-common-extensions \
        libyaml-dev \
        libyaml-cpp-dev \
        libpqxx-dev \
        libgoogle-glog-dev \
        libprotobuf-dev \
        protobuf-compiler \
        locate \
        gdb && \
        updatedb

RUN pip3 install requests conan==1.60.2 && \
        conan config set general.revisions_enabled=1 && \
        conan profile new default --detect && \
        conan profile update settings.compiler.libcxx=libstdc++11 default

# install osqp & osqp egien
WORKDIR /deps
RUN git clone --depth 1 --branch v0.6.2 \
    --recursive https://github.com/osqp/osqp.git && \
    cd osqp && mkdir build && cd build && cmake -DBUILD_SHARED_LIBS=ON .. && \
    make && make install

RUN git clone --depth 1 --branch v0.8.0 \
    https://github.com/robotology/osqp-eigen.git && \
    cd osqp-eigen && mkdir build && cd build && cmake .. && \
    make && make install

RUN echo "source /opt/ros/humble/setup.bash" >> ~/.bashrc
