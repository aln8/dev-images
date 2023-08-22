ARG DOCKER_REGISTRY=""
FROM ${DOCKER_REGISTRY}/base/ubuntu/focal:v1.3

# install ros prerequest
RUN curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key  -o /usr/share/keyrings/ros-archive-keyring.gpg && \
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(. /etc/os-release && echo $UBUNTU_CODENAME) main" | tee /etc/apt/sources.list.d/ros2.list > /dev/null && \
    apt update && add-apt-repository universe && apt update && apt upgrade && \
    apt install -y python3-flake8-docstrings python3-pip python3-pytest-cov ros-dev-tools && \
    python3 -m pip install -U \
        flake8-blind-except \
        flake8-builtins \
        flake8-class-newline \
        flake8-comprehensions \
        flake8-deprecated \
        flake8-import-order \
        flake8-quotes \
        "pytest>=5.3" \
        pytest-repeat \
        pytest-rerunfailures

WORKDIR /base/ros2_humble
RUN mkdir -p src && vcs import --input https://raw.githubusercontent.com/ros2/ros2/humble/ros2.repos src && \
    rosdep init && rosdep update && rosdep install --from-paths src --ignore-src -y --skip-keys "fastcdr rti-connext-dds-6.0.1 urdfdom_headers"

RUN colcon build && cp -rf install/ /opt/ros/humble/

RUN apt install -y \
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

RUN pip3 install --upgrade urllib3==1.26.6 requests conan==1.59.0 && \
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

RUN ldconfig

RUN echo "source /opt/ros/humble/setup.bash" >> ~/.bashrc
WORKDIR /app
