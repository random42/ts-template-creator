#!/bin/bash

DIR="${0%/*}"
source "$DIR/template.sh"

no_output() {
  echo
  echo "Running..."
  echo $@
  $@ >/dev/null
}


#exit 0

mkdir $1
cd $1
echo
echo "Creating files.."
mkdir "${FOLDERS[@]}"
touch "${FILES[@]}"
echo "$README" >> README.md
echo "$PACKAGE" >> package.json
echo "$TS_CONFIG" >> tsconfig.json
no_output "${ADD_PKG} ${DEV_FLAG} ${DEV_DEP[@]}"
if [ -n "$DEP" ]; then
  no_output "$ADD_PKG $DEP"
fi
if [ "$GIT" = "y" ]; then
  git init
  echo "$GIT_IGNORE" >> .gitignore
fi
exit 0
