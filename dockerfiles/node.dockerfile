FROM node:16-alpine

RUN npm install -g npm@latest

RUN chown -R 1000:1000 /root/.npm
