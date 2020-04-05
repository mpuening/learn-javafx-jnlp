#!/bin/bash

#MODULE_PATH=javafx-sdk-11.0.2/lib
#java --module-path $MODULE_PATH --add-modules javafx.controls -jar target/learn-javafxjnlp-0.0.1-SNAPSHOT.jar

M2_REPO=$HOME/.m2/repository

MODULE_PATH=\
$M2_REPO/org/openjfx/javafx-base/14/javafx-base-14-mac.jar:\
$M2_REPO/org/openjfx/javafx-controls/14/javafx-controls-14-mac.jar:\
$M2_REPO/org/openjfx/javafx-graphics/14/javafx-graphics-14-mac.jar

# Due to shade, this isn't needed, only modules
#CLASS_PATH=\
#$M2_REPO/org/openjfx/javafx-base/14/javafx-base-14.jar:\
#$M2_REPO/org/openjfx/javafx-controls/14/javafx-controls-14.jar:\
#$M2_REPO/org/openjfx/javafx-graphics/14/javafx-graphics-14.jar
#java --module-path $MODULE_PATH --add-modules javafx.controls -classpath $CLASS_PATH -jar target/learn-javafxjnlp-0.0.1-SNAPSHOT.jar

java --module-path $MODULE_PATH --add-modules javafx.controls -jar target/learn-javafxjnlp-0.0.1-SNAPSHOT.jar
