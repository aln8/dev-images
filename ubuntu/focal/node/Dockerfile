ARG DOCKER_REGISTRY=""
FROM ${DOCKER_REGISTRY}/base/ubuntu-focal:v1.1

RUN curl -fsSL https://deb.nodesource.com/setup_16.x | bash

RUN apt install -y nodejs

# semantic release gitlab
RUN npm install -g semantic-release \
    @semantic-release/commit-analyzer \
    @semantic-release/release-notes-generator \
    @semantic-release/changelog \
    @semantic-release/gitlab \
    conventional-changelog-conventionalcommits \
    @semantic-release/git

# commitlint conventional
RUN npm install -g commitlint \
    @commitlint/config-conventional
