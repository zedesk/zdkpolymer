FROM mhart/alpine-node:6.3.1

RUN apk add -U --virtual tools git sudo bash && \
    adduser -D web && \
    install -d /app -m 744 -o web && \
    npm i bower polymer-cli@0.15.0 -g && \
    echo "web   ALL=(ALL:ALL)	NOPASSWD:	ALL " > /etc/sudoers.d/web && \
    echo 'export PS1="\W > "' > /home/web/.bashrc

# Drop privileges
USER web
WORKDIR "/app"

LABEL polymer-cli="0.15.0"

VOLUME ["/app","/home/web"]
EXPOSE 8080
ENTRYPOINT ["polymer"]
CMD ["serve","-H","0.0.0.0"]
