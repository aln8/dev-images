FROM ubuntu:focal

ENV TZ=Asia/Shanghai \
    DEBIAN_FRONTEND=noninteractive \
    LANG=en_US.UTF-8

# install simple dev tools
RUN apt-get update && apt-get install -y ca-certificates; \
    aptArch="$(dpkg --print-architecture)"; \
    case "${aptArch}" in \
        amd64)  \
            { \
                echo "deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal main restricted universe multiverse"; \  
                echo "deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal-updates main restricted universe multiverse"; \
                echo "deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal-backports main restricted universe multiverse"; \
                echo "deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal-security main restricted universe multiverse"; \
            } > /etc/apt/sources.list;; \
        arm64) \
            { \
                echo "deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu-ports/ focal main restricted universe multiverse"; \  
                echo "deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu-ports/ focal-updates main restricted universe multiverse"; \
                echo "deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu-ports/ focal-backports main restricted universe multiverse"; \
                echo "deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu-ports/ focal-security main restricted universe multiverse"; \
            } > /etc/apt/sources.list;; \
    esac; \
    apt-get update && apt-get install -y \
        curl wget git tree htop vim libzip-dev unzip jq fzf iputils-ping telnet apt-transport-https tzdata \
        lsof net-tools rsync ca-certificates gnupg2 lsb-release software-properties-common locales zsh 

# adjust tz to asia/shanghai
RUN ln -fs /usr/share/zoneinfo/${TZ} /etc/localtime; \
    echo ${TZ} > /etc/timezone;

RUN locale-gen en_US en_US.UTF-8 zh_CN zh_CN.UTF-8 && \
    update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8

# install oh my zsh
RUN sh -c "$(curl -fsSL https://gitee.com/mirrors/oh-my-zsh/raw/master/tools/install.sh)" && \
    chsh -s /bin/zsh

# install pip3 and replace tsinghua source
RUN apt-get install -y python3-pip && \
    pip3 config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple
