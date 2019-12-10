FROM node:8.11-alpine

MAINTAINER Bob Liu <Bobliu0909@gmail.com>

#ADD humpback-web /humpback-web
ADD . /humpback-web

WORKDIR /humpback-web/src/server

CMD ["node", "index.js"]
