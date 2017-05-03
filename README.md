# zdkpolymer

A docker container to develop with polymer-cli.

This image is for development purpose only, and aims to set easily a dev environment to play with polymer.

The embedded version of polymer-cli is 0.17.0, compatibles with Polymer 1.x only.

## commands

The entrypoint of this container is polymer (polymer-cli command line) and some bower commands. By default the image run the "polymer serve"

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

## Command line helper

A command line helper is also provided, to avoid typing long docker commands. To get it :

```
curl https://raw.githubusercontent.com/zedesk/zdkpolymer/0.17.0/zdkpolymer |sudo tee /usr/local/bin/zdkpolymer > /dev/null
sudo chmod a+x /usr/local/bin/zdkpolymer
```

### Usage

   - `zdkpolymer -h` : the helper help
   - `zdkpolymer -v` : list available versions
   - `zdkpolymer [OPTIONS] [COMMAND]`

Options :

 - `-H` : mount your home directory, useful to share some git credential and config into the container
 - `-D` : run the container in background, useful when serving your work, The available URLs will be displayed.
 - `-V [arg]` : allow to select the zdkpolymer version, for example '0.17.0'

Command :

Any polymer-cli or bower commands, to obtain the list of the
available commands : `zdkpolymer help`

## How to use it

### fresh dev

Create your dev directory

    mkdir my-component && cd $_
    zdkpolymer init

to start serving your dev

    zdkpolymer -D

> __Nota :__ The container will have the same name as the directory.

to get the port of your app on the host machine

    docker port my-component

### from an existng project

Get your project

    git clone github.com/my-project
    cd my-project
    zdkpolymer install
    zdkpolymer -D
