FROM nginx:1.17

RUN apt-get update && apt-get install -y curl && \
    curl -sL https://deb.nodesource.com/setup_8.x | bash - && \
    apt-get install -y build-essential nodejs && \
    npm i -g @dojo/cli

COPY . /usr/local/app

WORKDIR /usr/local/app

RUN npm i
RUN dojo build

RUN cp -R /usr/local/app/output/dist/* /usr/share/nginx/html/
