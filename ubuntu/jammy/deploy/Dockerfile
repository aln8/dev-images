ARG DOCKER_REGISTRY=""
FROM ${DOCKER_REGISTRY}/base/ubuntu/jammy:v1.0

# install docker-ce-cli
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor | tee /usr/share/keyrings/docker-keyring.gpg; \
    echo "deb [signed-by=/usr/share/keyrings/docker-keyring.gpg] https://mirrors.tuna.tsinghua.edu.cn/docker-ce/linux/ubuntu \
    $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list && \
    apt update && apt install -y docker-ce-cli
    
# install terraform
RUN aptArch="$(dpkg --print-architecture)"; \
    case "${aptArch}" in \
        amd64)  \
            curl -fsSL https://apt.releases.hashicorp.com/gpg | gpg --dearmor | tee /usr/share/keyrings/hashicorp-archive-keyring.gpg; \
            echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/hashicorp.list; \
            apt update && apt install terraform;; \
        arm64) \
            wget https://releases.hashicorp.com/terraform/1.2.8/terraform_1.2.8_linux_arm64.zip; \
            unzip terraform_1.2.8_linux_arm64.zip; \
            mv terraform /usr/local/bin/;; \
    esac; \
    apt update && apt install -y sshpass;

# install conanapt install apt-transport-https ca-certificates curl gnupg2 software-properties-common
RUN pip3 install conan && \
        conan config set general.revisions_enabled=1 && \
        conan profile new default --detect && \
        conan profile update settings.compiler.libcxx=libstdc++11 default

# install ansible
RUN pip3 install ansible

# install kubectl
RUN aptArch="$(dpkg --print-architecture)"; \
    kubectlVer="$(curl -L -s https://dl.k8s.io/release/stable.txt)" && \
    curl -LO "https://dl.k8s.io/release/${kubectlVer}/bin/linux/${aptArch}/kubectl" && \
    curl -LO "https://dl.k8s.io/${kubectlVer}/bin/linux/${aptArch}/kubectl.sha256" && \
    echo "$(cat kubectl.sha256) kubectl" | sha256sum --check && \
    install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl && \
    kubectl version --client
# install dev dependency
RUN pip3 install ansible-lint[core,yamllint]

# install helm
RUN curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash
