ARG DOCKER_REGISTRY=""
FROM ${DOCKER_REGISTRY}/ros-foxy/base:v1.3

# install libclang-dev for ros2-rust lib
# lld will significantly reduce linking time
RUN apt update && apt install -y git libclang-dev python3-vcstool lld

# install rust
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
ENV PATH=/root/.cargo/bin:$PATH

# tuna souce for crate.io
RUN echo "[source.crates-io]" > ~/.cargo/config.toml; \
    echo "registry = \"https://github.com/rust-lang/crates.io-index\"" >> ~/.cargo/config.toml; \
    echo "replace-with = 'tuna'\n" >> ~/.cargo/config.toml; \
    echo "[source.tuna]" >> ~/.cargo/config.toml; \
    echo "registry = \"https://mirrors.tuna.tsinghua.edu.cn/git/crates.io-index.git\"\n" >> ~/.cargo/config.toml; \
    echo "[registries.cargo-local]" >> ~/.cargo/config.toml;\
    echo "index = \"https://artifactory.ldrauto.com/artifactory/git/cargo-local.git\"\n" >> ~/.cargo/config.toml;\
    echo "[build]" >> ~/.cargo/config.toml; \
    echo "rustflags = [\"-C\", \"link-arg=-fuse-ld=lld\"]\n" >> ~/.cargo/config.toml; \
    echo "[net]" >> ~/.cargo/config.toml; \
    echo "git-fetch-with-cli = true" >> ~/.cargo/config.toml; \
    echo "[credential]" > ~/.gitconfig; \
    echo "helper = store" >> ~/.gitconfig;

# RUN cat ~/.cargo/config.toml  && exit 1
RUN cargo install -vv cargo-ament-build cargo-workspaces protobuf-codegen
RUN pip3 install git+https://github.com/colcon/colcon-cargo.git git+https://github.com/colcon/colcon-ros-cargo.git
