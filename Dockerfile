FROM mhart/alpine-node:6.3.1

RUN apk add -U --virtual tools git sudo && \
    adduser -D web && \
    install -d /app -m 744 -o web && \
    npm i bower polymer-cli -g && \
    echo "web   ALL=(ALL:ALL)	NOPASSWD:	ALL " > /etc/sudoers.d/web

# Drop privileges
USER web
WORKDIR "/app"

VOLUME ["/app","/home/web"]
EXPOSE 8080
ENTRYPOINT ["npm"]
