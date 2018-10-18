if [ -z $1 ]; then
  echo "A path is required!"
  exit 1
fi

NAME=$(basename ${1})

# Reading project infos
echo -n '
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
  echo "You must have ${PKG_MNG} installed!"
  exit 1
fi
echo -n "Initialize git repository? [y/n] (n): "
read -n 1 GIT
echo '

Insert project infos. These are all optional, default values in brackets.'
echo -n "Description (): "
read DESC
DESC=${DESC:=''}
echo -n "Version (1.0.0): "
read VERSION
VERSION=${VERSION:='1.0.0'}
echo -n "License (MIT): "
read LICENSE
LICENSE=${LICENSE:='MIT'}
echo -n "Author (): "
read AUTHOR
echo -n "Path to entry point (index.ts): "
read ENTRY
ENTRY=${ENTRY:='index.ts'}
echo "Dependencies, space separated: "
read DEP
echo -n "Docs folder (docs): "
read DOCS_FOLDER
DOCS_FOLDER=${DOCS_FOLDER:='docs'}
echo -n "Source folder (src): "
read SRC
SRC=${SRC:='src'}
