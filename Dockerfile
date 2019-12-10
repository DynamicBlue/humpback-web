FROM node:8.11-alpine

MAINTAINER DynamicBlue <huajunsoft@outlook.com>

#ADD humpback-web /humpback-web
ADD . /humpback-web

WORKDIR /humpback-web/dist

CMD ["node", "index.js"]
