source "$DIR/input.sh"


TS_CONFIG='{
  "compilerOptions": {
    "module": "commonjs",
    "esModuleInterop": true,
    "target": "es6",
    "noImplicitAny": true,
    "moduleResolution": "node",
    "sourceMap": true,
    "baseUrl": ".",
    "paths": {
      "*": [
        "node_modules/*",
        "./'${SRC}'/types/*"
      ]
    }
  },
  "include": [
    "./'${SRC}'/**/*"
  ]
}
'

MAIN='./bin/main.js'
PROGRAMS='./node_modules/.bin'

PACKAGE='{
  "name": "'$NAME'",
  "version": "'${VERSION}'",
  "license": "'${LICENSE}'",
  "author": "'${AUTHOR}'",
  "description": "'${DESC}'",
  "main": "'${MAIN}'",
  "scripts": {
    "start": "'${PKG_MNG}' run build && node '${MAIN}'",
    "dev": "'${PKG_MNG}' run watch & '${PROGRAMS}'/nodemon '${MAIN}'",
    "build": "'${PROGRAMS}'/browserify '${ENTRY}' -p [ tsify ] -o '${MAIN}'",
    "watch": "'${PROGRAMS}'/watchify '${ENTRY}' -p [ tsify ] -o '${MAIN}'",
    "test": "'${PROGRAMS}'/jest",
    "docs": "'${PROGRAMS}'/esdoc && open '${DOCS_FOLDER}'/index.html"
  },
  "dependencies": {},
  "devDependencies": {},
  "jest": {
    "moduleFileExtensions": [
      "ts",
      "tsx",
      "js"
    ],
    "transform": {
      "^.+\\.(ts|tsx)$": "ts-jest"
    },
    "globals": {
      "ts-jest": {
        "tsConfig": "tsconfig.json"
      }
    },
    "testMatch": [
      "**/__tests__/*.+(ts|tsx|js)"
    ]
  },
  "esdoc": {
    "source": "'${SRC}'",
    "destination": "'${DOCS_FOLDER}'",
    "plugins": [
      {
        "name": "esdoc-standard-plugin"
      },
      {
        "name": "esdoc-typescript-plugin",
        "option": {
          "enable": true
        }
      }
    ]
  }
}
'

TYPES=(
"jest"
)

DEV_DEP=(
"typescript"
"tsify"
"browserify"
"watchify"
"jest"
"ts-jest"
"nodemon"
"esdoc"
"esdoc-standard-plugin"
"esdoc-typescript-plugin"
)

for i in $TYPES; do
  DEV_DEP[${#DEV_DEP}]="@types/$i"
done

FOLDERS=(
"$SRC"
"__tests__"
)

FILES=(
"$ENTRY"
"./README.md"
)

# echo ${folders[@]}

GIT_IGNORE='node_modules/
bin/
'${DOCS_FOLDER}'
'

README='# '${NAME}''
