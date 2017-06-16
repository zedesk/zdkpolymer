FROM node:6.11.0-alpine

ENV POLYMER_CLI_VERSION=1.1.0
ENV BOWER_VERSION=1.8.0

RUN apk add -U --virtual tools git sudo bash openssh-client && \
    npm i polymer-cli@${POLYMER_CLI_VERSION} bower@${BOWER_VERSION} -g && \
    echo 'export PS1="\W > "' > /home/node/.bashrc && \
    echo "prefix=/home/node/.npm-packages" > ~/.npmrc

ENV PATH /home/node/.npm-packages/bin:$PATH

COPY entrypoint.sh /usr/local/bin

LABEL MAINTAINER="F. Le Coz <fabrice.lecoz@zedesk.net>" \
      POLYMER_CLI_VERSION=${POLYMER_CLI_VERSION} \
      NODE_VERSION="6.11.0" \
      NPM_VERSION="3.10.10" \
      BOWER_VERSION=${BOWER_VERSION}

# Drop privileges
USER node

VOLUME ["/app","/home/node"]
WORKDIR "/app"
EXPOSE 8081
ENTRYPOINT ["entrypoint.sh"]
