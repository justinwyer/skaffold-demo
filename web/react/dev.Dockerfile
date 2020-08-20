
FROM node:alpine

WORKDIR /src

ADD package.json package.json
ADD yarn.lock yarn.lock
RUN npm install

ADD . /src

ENV PUBLIC_URL=/react/
ENV PUBLIC_PATH=/react/
ENV WDS_SOCKET_PATH=/react/sockjs-node

ENTRYPOINT yarn start
