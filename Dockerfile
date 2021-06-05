FROM node:14.16.1-alpine3.13 AS dev

WORKDIR /home/node/app
ENV NODE_ENV development

RUN apk add --update-cache \
    alpine-sdk  \
    autoconf \
    automake \
    build-base \
    file \
    git \
    libtool \
    libpng \
    libpng-dev \
    libwebp \
    libwebp-dev \
    libjpeg-turbo \
    libjpeg-turbo-dev \
    musl \
    nasm \
    zlib \
    zlib-dev \
  && rm -rf /var/cache/apk/*

COPY package*.json ./
RUN npm i --ignore-scripts
COPY . .

CMD ["npm", "start"]