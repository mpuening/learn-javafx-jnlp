#!/bin/sh

die() {
	echo "$*" 1>&2 ; exit 1;
}

test_exists() {
	command -v "$1" >/dev/null 2>&1 || { echo >&2 "Command "$1" not installed.  Aborting."; exit 1; }
}

# brew install create-dmg
test_exists create-dmg

cd $(dirname -- "$0")

DIR=HelloWorld.app/Contents/HelloWorld
rm -rf $DIR
mkdir -p $DIR

[[ -f ../../target/helloworld.zip ]] || die "helloworld.zip is missing. Please build application first."
unzip ../../target/helloworld.zip -d $DIR

# Ensure start command is executable
chmod a+rx HelloWorld.app/Contents/MacOS/helloworld

# https://github.com/andreyvit/create-dmg/blob/master/README.md

test -f HelloWorld-Installer.dmg && rm HelloWorld-Installer.dmg
create-dmg \
  --volname "HelloWorld Installer" \
  --window-pos 200 120 \
  --window-size 800 400 \
  --icon-size 100 \
  --icon "HelloWorld.app" 200 190 \
  --hide-extension "HelloWorld.app" \
  --app-drop-link 600 185 \
  "HelloWorld-Installer.dmg" \
  "HelloWorld.app/"

