FROM node:18.19.1-alpine as builder
WORKDIR /app
COPY ./package.json .
COPY ./package-lock.json .
RUN yarn install
COPY . .
FROM nginx:stable-alpine
WORKDIR /usr/share/nginx/html
RUN rm -rf ./*
EXPOSE 80
ENTRYPOINT [“nginx”, “-g”, “daemon off;”]
~                              
