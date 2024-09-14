# Dockerfile

# Step 1: Read the Node.js version from .nvmrc (or default)
ARG NODE_VERSION
FROM node:${NODE_VERSION}-alpine

RUN apk add --no-cache shadow

ARG UID
ARG GID

RUN groupmod -g ${GID} node \
    && usermod -u ${UID} -g ${GID} node \
    && chown -R node:node /home/node

ARG PNPM_VERSION=${PNPM_VERSION}
RUN npm install -g pnpm@${PNPM_VERSION}

USER node

WORKDIR /home/node/app

# Step 4: Ensure pnpm store directory exists and set proper permissions
RUN mkdir -p /home/node/app/.pnpm-store && chown -R node:node /home/node/app/.pnpm-store

RUN mkdir -p /home/node/app/build && chown -R node:node /home/node/app/build

# Step 5: Set environment variable for pnpm store
ENV PNPM_STORE_PATH=/home/node/app/.pnpm-store

COPY --chown=node:node . .
