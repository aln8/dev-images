FROM ubuntu-local:base-focal

# install rust
ENV RUSTUP_DIST_SERVER=https://mirrors.ustc.edu.cn/rust-static 
ENV RUSTUP_UPDATE_ROOT=https://mirrors.ustc.edu.cn/rust-static/rustup

RUN curl https://sh.rustup.rs -sSf | sh -s -- -y

# install dev component 
ENV PATH="/root/.cargo/bin:${PATH}"
RUN rustup toolchain install nightly && \
    rustup default nightly

RUN rustup component add \
    cargo clippy rust-docs rls rust-src rust-analysis \
    rustfmt rustc rust-std
