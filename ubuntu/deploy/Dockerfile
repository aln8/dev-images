FROM ubuntu-local:base-focal

# install docker-ce-cli
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - && \
    add-apt-repository \
        "deb https://mirrors.tuna.tsinghua.edu.cn/docker-ce/linux/ubuntu \
        $(lsb_release -cs) stable" && \
    apt-get update && apt-get install -y docker-ce-cli
    
# install terraform
RUN aptArch="$(dpkg --print-architecture)"; \
    case "${aptArch}" in \
        amd64)  \
            curl -fsSL https://apt.releases.hashicorp.com/gpg | apt-key add - ; \
            apt-add-repository "deb [arch=${aptArch}] https://apt.releases.hashicorp.com $(lsb_release -cs) main"; \
            apt-get update && apt-get install -y terraform;; \
        arm64) \
            wget https://releases.hashicorp.com/terraform/1.1.7/terraform_1.1.7_linux_arm64.zip; \
            unzip terraform_1.1.7_linux_arm64.zip; \
            mv terraform /usr/local/bin/;; \
    esac; \
    apt-get update && apt-get install -y sshpass;

# install conanapt-get install apt-transport-https ca-certificates curl gnupg2 software-properties-common
RUN pip3 install conan && \
        conan config set general.revisions_enabled=1 && \
        conan profile new default --detect && \
        conan profile update settings.compiler.libcxx=libstdc++11 default

# install ansible
RUN pip3 install ansible

# install kubectl
RUN bash -c 'curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" && \
    curl -LO "https://dl.k8s.io/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256" && \
    echo "$(<kubectl.sha256) kubectl" | sha256sum --check && \
    install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl && \
    kubectl version --client'

# install dev dependency
RUN pip3 install ansible-lint[core,yamllint]

# install helm
RUN curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash
