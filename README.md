# ts-template-creator

## Description

A node/browser project creator that installs:
- typescript
- jest
- browserify
- esdoc

First bash script. Still don't know how to properly create an installation makefile.

### Installation

```bash
$ git clone https://github.com/robertosero/ts-template-creator.git
$ cd ts-template-creator
$ make install
```

This will add **ts-template-creator** to */usr/local/bin* and copy this repo to *~/.ts-template-creator*.

To uninstall:

`$ make uninstall`

### Usage

`$ ts-template-creator </path/to/new_project>`

Now type some configs:
```
$ ts-template-creator /path/to/new_project

Welcome to the typescript template creator!
Which package manager do you use? [yarn/npm] (yarn):
Initialize git repository? [y/n] (n): y

Insert project infos. These are all optional, default values in brackets.
Description ():
Version (1.0.0):
License (MIT):
Author (): robertosero
Path to entry point (index.ts): src/main.ts
Dependencies, space separated:

Docs folder (docs):
Source folder (src):

Creating files..

Running...
yarn add --dev typescript tsify browserify watchify jest ts-jest nodemon esdoc esdoc-standard-plugin esdoc-typescript-plugin @types/jest

Initialized empty Git repository in /path/to/new_project/.git/
```


### Scripts

#### start

Builds and start node.

#### dev

Watch for file changes to restart node.

#### test

Runs jest.

#### docs

Generate EsDoc documentation and opens it on browser.

#### build

Compile ts and bundle into *bin/index.js*.

#### watch

Watch for file changes to build.
