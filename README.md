# zdkpolymer

A docker container to develop with polymer-cli

The entrypoint of this container is polymer (polymer-cli command line) and some bower commands. By default the image run the "polymer serve"

## Supported tags and respective Dockerfile links

 - [0.18.0-alpha.9, latest][2]
 - [0.17.0][1]

## commands

available commands are :

  - Polymer commands :
    - __init__ : initialize a developpment ( run polymer init )
    - __build__ : build the application
    - __lint__ : lints the project
    - __serve__ : Runs the polyserve development server
  - Bower commands :
    - __install [_package_]__: install dependencies declared in bower.json or the package given on the command line
    - __uninstall _package___ : uninstall a package
    - __update _package___ : update an installed package
    - __search _package___ : search for a package in the bower repository
    - __list__ : list all installed packages
    - __prune__ : uninstalls local extraneous packages
    - __info _package___ : displays overall information of a package or of a particular version.
    - __cache__ : manage bower cache

A command line helper is also provided, to avoid typing long docker commands. To get it :

```bash
curl https://raw.githubusercontent.com/zedesk/zdkpolymer/master/zdkpolymer |sudo tee /usr/bin/local/zdkpolymer
sudo chmod a+x zdkpolymer
```

## How to use it

the `zdkpolymer` command helper should be run from the project directory. The container will be named as the directory.

```bash
zdkpolymer [OPTIONS] [CMD] [CMDARGS]
```

Available options are :

 - __-D__ : run the container in background, and serves the application on an arbitrary port. there is no CMD in this case, and CMDARGS is the directory used as DOCUMENT ROOT.
 - __-H__ : allows to mount the user home directory, it could be usefull when using dependencies from a git directory and use the user credentials
 - __-V [version]__ : allows to choose the image version of `zedesk/zdkpolymer`, without this option, the command line helper will use the most recent image.

Available commands :

  - see commands above

### fresh dev

Create your dev directory

    mkdir my-component && cd $_
    zdkpolymer init

to start serving your dev

    zdkpolymer -D

to get the port of your app on the host machine

    zdkpolymer port

### from an existing project

Get your project

    git clone github.com/my-project
    cd my-project

install dependencies

    zdkpolymer install

serve it

    zdkpolymer -D

[1]: https://github.com/zedesk/zdkpolymer/blob/v0.17.0/Dockerfile
[2]: https://github.com/zedesk/zdkpolymer/blob/v0.18.0-alpha.9/Dockerfile
