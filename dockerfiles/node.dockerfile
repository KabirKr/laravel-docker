FROM node:16-alpine

WORKDIR /var/www/html

COPY . .

RUN npm install -g npm@latest

RUN chown -R 1000:1000 /root/.npm

EXPOSE 3000
EXPOSE 3001
