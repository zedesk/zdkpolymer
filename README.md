# zdkpolymer

[![](https://images.microbadger.com/badges/version/zedesk/zdkpolymer.svg)](https://microbadger.com/images/zedesk/zdkpolymer "Get your own version badge on microbadger.com")
[![](https://images.microbadger.com/badges/image/zedesk/zdkpolymer.svg)](https://microbadger.com/images/zedesk/zdkpolymer "Get your own image badge on microbadger.com")
[![Docker Automated buil](https://img.shields.io/docker/automated/zedesk/zdkpolymer.svg)](https://hub.docker.com/r/zedesk/zdkpolymer/)
[![Docker Pulls](https://img.shields.io/docker/pulls/zedesk/zdkpolymer.svg)](https://hub.docker.com/r/zedesk/zdkpolymer/)

A docker container to develop with polymer-cli

## Supported tags and respective Dockerfile links

 - [1.5, 1.5.6, latest][13]
 - [1.4, 1.4.1][12]
 - [1.3, 1.3.1][11]
 - [1.2, 1.2.0][10]
 - [1.1, 1.1.0][9]
 - [1.0, 1.0.2][8]
 - [0.17.0][1]

The polymer-cli version includes several improvements see the [lastest polymer-cli documentation][polymer-cli-doc]

## commands

The entrypoint of this container is polymer (polymer-cli command line) and some bower commands. By default the image run the "polymer serve"

available commands are :
  
  - Special command :
    - __docs__ : Writes analysis metadata in JSON format to standard out without inherited methods from Polymer.element
  - Polymer commands :
    - __init__ : initialize a developpment ( run polymer init )
    - __build__ : build the application
    - __lint__ : lints the project
    - __serve__ : Runs the polyserve development server
    - __analyze__ : Writes analysis metadata in JSON format to standard out
    - __lint__ : Identifies potential errors in your code.
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
curl https://raw.githubusercontent.com/zedesk/zdkpolymer/master/zdkpolymer |sudo tee /usr/local/bin/zdkpolymer > /dev/null
sudo chmod a+x /usr/local/bin/zdkpolymer
```

## How to use it

the `zdkpolymer` command helper should be run from the project directory. The container will be named as the directory.

 - `zdkpolymer -h` : the helper help
 - `zdkpolymer -v` : list available versions
 - `zdkpolymer [OPTIONS] [COMMAND]`

Options :

 - __-H__ : mount your home directory, useful to share some git credential and config into the container
 - __-D__ : run the container in background, useful when serving your work, The available URLs will be displayed.
 - __-V [arg]__ : allow to select the zdkpolymer version, for example '0.17.0'

Command :

Any polymer-cli or bower commands, to obtain the list of the
available commands : `zdkpolymer help`

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

# build and serve

to build a polymer application :

    zdkpolymer build

then to serve the application

    # stop the container if exists
    zdkpolymer stop
    zdkpolymer -D build/unbundled

[1]: https://github.com/zedesk/zdkpolymer/blob/0.17.0/Dockerfile
[6]: https://github.com/zedesk/zdkpolymer/blob/0.18.0/Dockerfile
[7]: https://github.com/zedesk/zdkpolymer/blob/0.18.1/Dockerfile
[8]: https://github.com/zedesk/zdkpolymer/blob/1.0.2/Dockerfile
[9]: https://github.com/zedesk/zdkpolymer/blob/1.1.0/Dockerfile
[10]: https://github.com/zedesk/zdkpolymer/blob/1.2.0/Dockerfile
[11]: https://github.com/zedesk/zdkpolymer/blob/1.3.1/Dockerfile
[12]: https://github.com/zedesk/zdkpolymer/blob/1.4.1/Dockerfile
[13]: https://github.com/zedesk/zdkpolymer/blob/1.5.6/Dockerfile
[polymer-cli-doc]: https://github.com/Polymer/docs/blob/ff74953fa93ad41d659a6f5a14c5f7072368edbd/app/2.0/docs/tools/polymer-json.md#builds
[polymer-project]: https://www.polymer-project.org/
