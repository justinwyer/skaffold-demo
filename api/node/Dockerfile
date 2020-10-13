FROM bitnami/node:14-prod

WORKDIR /app
ADD package.json /app/package.json
RUN npm install

ADD . /app/

CMD node api.js