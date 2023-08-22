ARG DOCKER_REGISTRY=""
FROM ${DOCKER_REGISTRY}/base/ubuntu/jammy:v1.2

# default env just in case it not set
ENV GO111MODULE on
ENV GOPROXY https://goproxy.cn

# install golang
RUN add-apt-repository -y ppa:longsleep/golang-backports && \
    apt update && \
    apt install -y golang-go

ENV PATH ${PATH}:/root/go/bin

# install docker-ce-cli
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - && \
    add-apt-repository \
        "deb https://mirrors.tuna.tsinghua.edu.cn/docker-ce/linux/ubuntu \
        $(lsb_release -cs) \
        stable" && \
    apt update && apt install -y docker-ce-cli

# go dev tools
RUN go install github.com/uudashr/gopkgs/...@latest && \
    go install github.com/haya14busa/goplay/...@latest && \
    go install golang.org/x/tools/gopls@latest && \
    go install github.com/cweill/gotests/...@latest && \
    go install github.com/go-delve/delve/cmd/dlv@latest && \
    go install github.com/josharian/impl@latest && \
    go install honnef.co/go/tools/cmd/staticcheck@latest

# protoc and golang proto tools
RUN apt install -y protobuf-compiler && \
    go install google.golang.org/protobuf/cmd/protoc-gen-go@v1.28 && \
    go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@v1.2 && \
    go install github.com/grpc-ecosystem/grpc-gateway/v2/protoc-gen-grpc-gateway@v2.16.2 && \
    go install github.com/grpc-ecosystem/grpc-gateway/v2/protoc-gen-openapiv2@v2.16.2 && \
    go install github.com/google/wire/cmd/wire@latest

# protoc google annotation
RUN git clone https://gitee.com/mirrors/googleapis.git /root/googleapis && \
    rm -rf /root/googleapis/.git

RUN curl -fL https://getcli.jfrog.io | bash -s v2 && \
    mv jfrog /usr/local/bin
