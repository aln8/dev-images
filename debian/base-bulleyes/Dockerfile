FROM debian:bullseye-slim

ENV TZ=Asia/Shanghai \
    DEBIAN_FRONTEND=noninteractive \
    LANG=en_US.UTF-8

# install simple dev tools
RUN set -eux; \
    apt update && apt install -y apt-transport-https ca-certificates; \
    { \
        echo "deb https://mirrors.tuna.tsinghua.edu.cn/debian/ bullseye main contrib non-free"; \
        echo "deb https://mirrors.tuna.tsinghua.edu.cn/debian/ bullseye-updates main contrib non-free"; \
        echo "deb https://mirrors.tuna.tsinghua.edu.cn/debian/ bullseye-backports main contrib non-free"; \
        echo "deb https://mirrors.tuna.tsinghua.edu.cn/debian-security bullseye-security main contrib non-free"; \
    } > /etc/apt/sources.list; \
    apt update && apt install -y \
        curl wget git tree htop vim libzip-dev unzip jq fzf iputils-ping telnet apt-transport-https tzdata \
        lsof net-tools rsync ca-certificates gnupg2 lsb-release software-properties-common locales zsh 
