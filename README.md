Learn JavaFX and JNLP
=====================

[![Continuous Integration](https://github.com/mpuening/learn-javafx-jnlp/actions/workflows/ci.yml/badge.svg)](https://github.com/mpuening/learn-javafx-jnlp/actions/workflows/ci.yml)

This project is my answer to what happened to Java Applets.

Java Applets were once the rage for rich internet applications. You could do many fantastic 
user interface designs with Java Applets that would not be possible with JavaScript/HTML 
until many years later. But many years have passed, and web browser plug-ins have become
fraught with security vulnerabilities and now doing Java Applets in a non-starter.

So what is the best way to develop and deliver Java applications with rich user interfaces? 

## JavaFX

Java Applets were implemented with Swing. While Swing is still a thing, the logical 
successor is JavaFX. While JavaFX is no longer distributed with Java, it is still being 
developed here: https://openjfx.io/

## JNLP

The Java Network Launch Protocol, JNLP, is also no longer distributed with Java, but its 
successor can be found here: https://openwebstart.com/

## JLink

An alternative to JNLP is JLink which is a Java tool to assemble and optimize modules and 
dependencies into a custom runtime image that users can download, unzip, and run.

So what is in this project?
===========================

This project have a very simple "Hello World" JavaFX application. But there are a couple 
of deployments to show how to deploy an application.

To build this project, run this command:

```
./mvnw clean package javafx:jlink
```

And to test if the build worked, you can run either of these two commands:

```
./mvnw javafx:run

./target/helloworld/bin/helloworld
```

Note: the second command assumes you are using a Unix style computer. Use the batch 
file on a Windows system.

## Deployments

Once the application is built, you can move on to how you want to deploy this application. 

### JNLP

To support JNLP today, your customers need to have OpenWebStart installed, which you 
can see the link above.

The application and its JNLP file would then be served up from a web site. To demo 
this setup, there is a simple docker image to use. To see the image in action, run 
these commands:

```
cd deployments/jnlp

./copy-and-sign-jars.sh

./build-image.sh

./run-image.sh
```

Yes, we are self signing these jar files, and you should do better.

Once the image is running, open `http://localhost:8080` and follow the instructions 
on the web site. Getting the browser to natively understand JNLP files is probably 
the biggest challenge.

If you want to see the JNLP file work without docker, just right click the `helloworld-local.jnlp` 
file and open with Open Web Start. It works from the file system.

### JLink

If JNLP is not something you want your customers using, there is also the JLink technology 
which is nothing more than customers downloading the application and being able to 
run it locally.

To see how you can serve up the zip file, you can build and run this docker image which 
these commands:

```
cd deployments/jlink

./copy-zip.sh

./build-image.sh

./run-image.sh
```

Once the image is running, open `http://localhost:8080` and follow the instructions 
on the web site.

You can do better by building an installer such as a DMG file for Mac, or an NSIS installer 
for Windows.

Also keep and eye out for this: https://openjdk.java.net/jeps/343

### DMG

The `deployments/dmg` directory contains a script and resources to create a DMG file 
for the MacOS.

To have icons for the installer (`helloworld.icns`), I used a set found on http://www.iconarchive.com

Here is the information for the those icons, used in a non-commercial use:

Title: Mac Launchpad Icon

URL: http://www.iconarchive.com/show/simply-styled-icons-by-dakirby309/Mac-Launchpad-icon.html

Author: http://www.iconarchive.com/artist/dakirby309.html

Author URL: http://dakirby309.deviantart.com/

License: https://creativecommons.org/licenses/by-nc-nd/4.0/

To build the DMG, one needs to have the `create-dmg` command installed, which is easily 
done via this brew command:

```
brew install create-dmg
```

This is the command to create the DMG file:

```
./deployments/dmg/create-dmg.sh
```

The file will be located at:

```
./deployments/dmg/HelloWorld-Installer.dmg
```

## TODO

Enhance the JavaFX example to do something non-trivial and use dependencies to ensure 
that the `shade` plug-in is working properly.

Build installers for Windows (NSIS) and Linux.
