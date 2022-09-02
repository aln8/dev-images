FROM gradle:jdk11

RUN aptArch="$(dpkg --print-architecture)"; \
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
    apt update && apt install -y vim zsh

# install oh my zsh
RUN sh -c "$(curl -fsSL https://gitee.com/mirrors/oh-my-zsh/raw/master/tools/install.sh)" && \
    chsh -s /bin/zsh

# install pip3 and replace tsinghua source
RUN apt install -y python3-pip && \
    pip3 config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple

