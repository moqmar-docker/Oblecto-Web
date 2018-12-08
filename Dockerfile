# Use a node.js container to build the production version of Oblecto-Web
FROM node AS build

COPY . /data
WORKDIR /data
RUN sed -i 's|http://prometheus:8080|/oblecto-server|g' src/config.json
RUN npm install
RUN npm run build

# This is the Apache-licensed version of https://caddyserver.com/ with Alpine Linux
FROM momar/caddy

USER 0
RUN echo -e "http:// {\n\
    root /data/public\n\
    proxy /socket.io http://server {\n\
        websocket\n\
        transparent\n\
    }\n\
    proxy /oblecto-server http://server {\n\
        without /oblecto-server\n\
        websocket\n\
        transparent\n\
    }\n\
    rewrite .* {path} {path}/ /index.html\n\
    gzip\n\
}" > /data/Caddyfile
USER 1000

COPY --from=build /data/dist /data/public
