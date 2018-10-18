#!/usr/bin/env bash

DIR=$(dirname $(readlink "$0"))
source "$DIR/template.sh"

error() {
  echo $@
  exit 1
}

no_output() {
  echo
  echo "Running..."
  echo $@
  $@ >/dev/null
}


#exit 0

mkdir -p $1
cd $1
echo
echo "Creating files.."
mkdir "${FOLDERS[@]}"
touch "${FILES[@]}"
echo "$README" > README.md
echo "$PACKAGE" > package.json
echo "$TS_CONFIG" > tsconfig.json
no_output "${ADD_PKG} ${DEV_FLAG} ${DEV_DEP[@]}" ||
error "Error installing dev dependencies"
if [ -n "$DEP" ]; then
  no_output "$ADD_PKG $DEP" ||
  error "Error installing dependencies"
fi
if [ "$GIT" = "y" ]; then
  echo
  git init
  echo "$GIT_IGNORE" >> .gitignore
fi
exit 0
