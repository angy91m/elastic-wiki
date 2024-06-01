FROM node:20-slim
USER root
RUN apt update -y && apt install -y build-essential curl
USER node
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
SHELL ["/bin/bash", "-c"]
RUN source $HOME/.cargo/env
ENV NPM_CONFIG_PREFIX=/home/node/.npm-global
ENV PATH=$PATH:/home/node/.npm-global/bin
RUN npm i -g node-gyp cargo-cp-artifact