
FROM node:alpine

WORKDIR /src

RUN npm install -g @angular/cli
ADD package.json package.json
RUN npm install

ADD . /src

ENTRYPOINT ng serve --host 0.0.0.0 --port 8080 --disableHostCheck=true --baseHref=/angular/ --servePath=/ --deployUrl=/angular/ --publicHost=http://0.0.0.0/angular/
