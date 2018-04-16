FROM node:7.7.4-alpine

EXPOSE 3000
RUN mkdir /src
COPY ./node/app.js /src
WORKDIR /src
CMD node app.js
