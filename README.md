# zdkpolymer

A docker container to develop with polymer-cli

The entrypoint of this container is polymer (polymer-cli command line) and some bower commands. By default the image run the "polymer serve"

## commands

available commands are :

  - Polymer commands :
    - init : initialize a developpment ( run polymer init )
    - build : build the application
    - lint : lints the project
    - serve : Runs the polyserve development server
  - Bower commands :
    - install [_package_]: install dependencies declared in bower.json or the package given on the command line
    - uninstall _package_ : uninstall a package
    - update _package_ : update an installed package
    - search _package_ : search for a package in the bower repository
    - list : list all installed packages
    - prune : uninstalls local extraneous packages
    - info _package_ : displays overall information of a package or of a particular version.
    - cache : manage bower cache

## How to use it

### fresh dev

Create your dev directory

    mkdir my-component && cd $_
    docker run -it --rm -v $PWD:/app --name my-component zdkpolymer init

to start serving your dev

    docker run -it --rm -v $PWD:/app --name my-component -p 8080 zdkpolymer

to get the port of your app on the host machine

    docker port my-component

### from an existng project

Get your project

    git clone github.com/my-project
    cd my-project
    docker run -it --rm -v $PWD:/app --name my-component zdkpolymer install
    docker run -it --rm -v $PWD:/app --name my-component -p 8080 zdkpolymer
