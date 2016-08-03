A docker container to develop with polymer-cli

The entrypoint of this container is npm

How to use it

Create your dev directory

    mkdir my-component && cd $_
    docker run -it --rm -v $PWD:/app zdkpolymer init -f

The above command will create a package.json file in your directory

Complete the script section :

    "scripts": {
      ...
      "polymer":"polymer",
      "polymer:serve":"polymer serve -v -H 0.0.0.0",
      "bower":"bower"
    },

> __Nota :__ The `polymer serve` command will serve by default on localhost (127.0.0.1), as the app is running into a docker container, the tool must be bound to the IP of the container.

then initialize your polymer development

    docker run -it --rm -v $PWD:/app zdkpolymer run polymer init

to start serving your dev

    docker run -it --rm -v $PWD:/app zdkpolymer run polymer:serve
