#!/bin/bash

M2_REPO=$HOME/.m2/repository

mkdir -p lib

#cp \
#$M2_REPO/org/openjfx/javafx-base/14/javafx-base-14-mac.jar \
#$M2_REPO/org/openjfx/javafx-controls/14/javafx-controls-14-mac.jar \
#$M2_REPO/org/openjfx/javafx-graphics/14/javafx-graphics-14-mac.jar \
#lib

cp \
../../target/learn-javafxjnlp-0.0.1-SNAPSHOT.jar \
lib

# Create key if not present
if [ ! -f mycert ]; then
	keytool -genkey -alias mycert -keystore mycert -keypass changeit -dname "CN=HelloWorld" -storepass changeit -validity 365
fi

#jarsigner -keystore mycert -keypass changeit -storepass changeit lib/javafx-base-14-mac.jar mycert
#jarsigner -keystore mycert -keypass changeit -storepass changeit lib/javafx-controls-14-mac.jar mycert
#jarsigner -keystore mycert -keypass changeit -storepass changeit lib/javafx-graphics-14-mac.jar mycert
jarsigner -keystore mycert -keypass changeit -storepass changeit lib/learn-javafxjnlp-0.0.1-SNAPSHOT.jar mycert
