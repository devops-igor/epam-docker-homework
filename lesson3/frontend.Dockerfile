# build environment
FROM node:16-alpine as build

# set working directory
WORKDIR /frontend

# install app dependencies
COPY frontend/app/package*.json ./
RUN npm install --silent
COPY frontend/app .
RUN npm run build

# production environment
FROM caddy:2.4.6
LABEL version="1.0.0" maintainer="Igor Skorokhodov <my-email@example.com>"
RUN adduser -D caddy
COPY --from=build --chown=caddy /frontend/build /usr/share/caddy/
COPY --chown=caddy frontend/Caddyfile /etc/caddy/Caddyfile
USER caddy
