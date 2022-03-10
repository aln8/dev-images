FROM nvcr.io/nvidia/l4t-ml:r32.6.1-py3

ENV SHELL=/bin/bash \
    TZ=Asia/Shanghai \
    DEBIAN_FRONTEND=noninteractive \
    LANG=en_US.UTF-8 \
    PYTHONIOENCODING=utf-8

SHELL ["/bin/bash", "-c"]

# install simple dev tools
RUN apt update && apt install -y ca-certificates; \
    sed -i 's/ports.ubuntu.com/mirrors.tuna.tsinghua.edu.cn/g' /etc/apt/sources.list; \
    apt update && apt install -y \
        curl wget git tree htop vim libzip-dev unzip jq iputils-ping telnet apt-transport-https tzdata \
        lsof net-tools rsync ca-certificates gnupg2 lsb-release software-properties-common locales locales-all 

RUN ln -fs /usr/share/zoneinfo/${TZ} /etc/localtime; \
    echo ${TZ} > /etc/timezone; \
    locale-gen en_US en_US.UTF-8 zh_CN zh_CN.UTF-8; \
    update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8

RUN echo 'deb https://mirrors.aliyun.com/ros2/ubuntu/ focal main' > /etc/apt/sources.list.d/ros2.list; \
    curl -sSL http://repo.ros2.org/repos.key | apt-key add -

RUN apt update && apt install -y \
        build-essential \
        cmake \
        git \
        libbullet-dev \
        python3-colcon-common-extensions \
        python3-flake8 \
        python3-pip \
        python3-pytest-cov \
        python3-rosdep \
        python3-setuptools \
        python3-vcstool \
        wget \
        liblog4cxx-dev

RUN pip3 install -U pip -i https://pypi.tuna.tsinghua.edu.cn/simple; \
    pip3 config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple 

RUN python3 -m pip install -U \
        argcomplete \
        rosinstall-generator \
        flake8-blind-except \
        flake8-builtins \
        flake8-class-newline \
        flake8-comprehensions \
        flake8-deprecated \
        flake8-docstrings \
        flake8-import-order \
        flake8-quotes \
        pytest-repeat \
        pytest-rerunfailures \
        pytest \
        lark

# install Fast-RTPS, CycloneDDS dependencies
RUN apt install --no-install-recommends -y \
        libasio-dev \
        libtinyxml2-dev \
        libcunit1-dev

# upgrade cmake, some ros package needs that
RUN wget -qO - https://apt.kitware.com/keys/kitware-archive-latest.asc | apt-key add - && \
    apt-add-repository 'deb https://apt.kitware.com/ubuntu/ bionic main' && \
    apt update && \
    apt install -y --no-install-recommends --only-upgrade cmake; \
    cmake --version

ARG ROS_PKG=ros_base
ENV ROS_DISTRO=foxy
ENV ROS_ROOT=/opt/ros/${ROS_DISTRO}

ARG https_proxy=''
RUN set -eux; mkdir -p ${ROS_ROOT}/src && \
    cd ${ROS_ROOT} && \
    rosinstall_generator --deps --rosdistro ${ROS_DISTRO} ${ROS_PKG} \
        rviz2 > ros2.${ROS_DISTRO}.${ROS_PKG}.rosinstall && \
    vcs import src < ros2.${ROS_DISTRO}.${ROS_PKG}.rosinstall; \
    apt update && \
    rosdep init && \
    rosdep update && \
    rosdep install -y \
    	  --ignore-src \
       --from-paths src \
	  --rosdistro ${ROS_DISTRO};

# build ros2
RUN cd ${ROS_ROOT} && colcon build --merge-install && \
    rm -rf ${ROS_ROOT}/logs && \
    rm -rf ${ROS_ROOT}/build

# setup gtest
RUN apt install -y libgtest-dev && \
    cd /usr/src/gtest && \
    cmake CMakeLists.txt && \
    make && cp *.a /usr/lib

# setup protobuf 3.6.1
WORKDIR /tmp
RUN apt install -y autoconf automake libtool && \
    git clone --depth 1 --branch v3.6.1 https://github.com/google/protobuf.git && \
    cd protobuf/ && git submodule update --init --recursive
RUN cd protobuf/ && ./autogen.sh && ./configure && make -j4 && make install && ldconfig
WORKDIR /

# setup conan
RUN pip3 install --upgrade urllib3==1.26.6 requests conan && \
        conan config set general.revisions_enabled=1 && \
        conan profile new default --detect && \
        conan profile update settings.compiler.libcxx=libstdc++11 default

# setup bashrc
RUN echo 'source ${ROS_ROOT}/install/setup.bash' >> /root/.bashrc 
CMD ["bash"]
