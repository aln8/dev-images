ARG DOCKER_REGISTRY=""
FROM ${DOCKER_REGISTRY}/base/ubuntu-focal:v1.1

# install ros
RUN curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key  -o /usr/share/keyrings/ros-archive-keyring.gpg && \
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] https://mirrors.aliyun.com/ros2/ubuntu focal main" | tee /etc/apt/sources.list.d/ros2.list > /dev/null && \
    apt-get update && apt-get install ros-foxy-desktop -y

RUN apt-get install -y \
        ros-foxy-rmw-cyclonedds-cpp \
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

RUN pip3 install --upgrade urllib3==1.26.6 requests conan && \
        conan config set general.revisions_enabled=1 && \
        conan profile new default --detect && \
        conan profile update settings.compiler.libcxx=libstdc++11 default

# install osqp
WORKDIR /deps
RUN git clone --depth 1 --branch release-0.5.0 \
    --recursive https://github.com/osqp/osqp.git && \
    cd osqp && mkdir build && cd build && cmake -G "Unix Makefiles" .. && \
    cmake --build . --target install
RUN ldconfig

RUN echo "source /opt/ros/foxy/setup.bash" >> ~/.bashrc
