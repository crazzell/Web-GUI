CommunitySqueeze
================

Community Squeeze OS Web Configuration

This project provides a Web Configuration GUI for the network interfaces and service control 
for the Community Squeeze Player project, using the Wandboard hardware, running the Community 
Squeeze Operating System, which is based on the Fedora 18 ARM release.

The Web-GUI is built on Java servlet technology, using Apache Struts, and is deployed to Apache 
Tomcat. The source code in this repository is an Eclipse Dynamic Web Project. The deployment 
WAR, (CommunitySqueeze.war), can be built and deployed from the Eclipse project.

CommunitySqueeze/src/org/communitysqueeze/util contains the Java source code for the utility 
classes, mostly concerned with executing commands, and reading/writing config files.

CommunitySqueeze/src/org/communitysqueeze/web contains the Java source code for the Struts 
actions, which service the web page requests.
