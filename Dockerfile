FROM mhart/alpine-node:6.9.4

MAINTAINER F. Le Coz <fabrice.lecoz@zedesk.net>

ENV POLYMER_CLI_VERSION=0.18.0-alpha.9
ENV BOWER_VERSION=1.8.0

RUN apk add -U --virtual tools git sudo bash openssh-client && \
    adduser -D web && \
    npm i polymer-cli@${POLYMER_CLI_VERSION} bower@${BOWER_VERSION} generator-polymer-init-custom-build -g && \
    echo "web   ALL=(ALL:ALL)	NOPASSWD:	ALL " > /etc/sudoers.d/web && \
    echo 'export PS1="\W > "' > /home/web/.bashrc

COPY entrypoint.sh /usr/local/bin

LABEL POLYMER_VERSION=${POLYMER_VERSION} \
      NODE_VERSION="6.9.4" \
      NPM_VERSION="3" \
      BOWER_VERSION=${BOWER_VERSION}

# Drop privileges
USER web

VOLUME ["/app","/home/web"]
WORKDIR "/app"
EXPOSE 8081
ENTRYPOINT ["entrypoint.sh"]
