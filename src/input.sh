
DIR="${0%/*}"
if [ -z $1 ]; then
  echo "A path is required!"
  exit 1
fi

NAME=${1##*/}

# Reading project infos
echo '
Welcome to the typescript/jest node template creation!
Which package manager do you use? [yarn/npm] (yarn):'
read PKG_MNG
PKG_MNG=${PKG_MNG:='yarn'}
ADD_PKG=''
DEV_FLAG=''
if [ "$PKG_MNG" = 'yarn' ]; then
  ADD_PKG='yarn add'
  DEV_FLAG='--dev'
elif [ "$PKG_MNG" = 'npm' ]; then
  ADD_PKG='npm install'
  DEV_FLAG='--save-dev'
else
  echo 'Invalid package manager!'
  exit 1
fi
if [ -z $(which ${PKG_MNG}) ]; then
  echo "I think you don't have this package manager <.<"
  exit 1
fi
echo "Initialize git repository? [y/n] (n)"
read GIT
echo 'Insert project infos'
echo "Description ():"
read DESC
DESC=${DESC:=''}
echo "Version (1.0.0):"
read VERSION
VERSION=${VERSION:='1.0.0'}
echo "License (MIT):"
read LICENSE
LICENSE=${LICENSE:='MIT'}
echo "Author ():"
read AUTHOR
echo "Entry point (main.ts):"
read ENTRY
ENTRY=${ENTRY:='main.ts'}
echo "Dependencies (space separated):"
read DEP
echo "Docs folder (docs):"
read DOCS_FOLDER
DOCS_FOLDER=${DOCS_FOLDER:='docs'}
echo "Source folder (src):"
read SRC
SRC=${SRC:='src'}
