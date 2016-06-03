openshift-s2i-grails2
=====================

OpenShift S2I builder image for projects using the Grails 2.x framework.

Runs the application in production mode using the embedded web server. Requires use
of the Gradle wrapper. This means the particular version of
Grails you want to use will be downloaded on-demand. This builder has
OpenJava 1.8.0 installed on CentOS 7.

This builder supports incremental builds.

Image Stream
------------
The builder can be imported into OpenShift using the file at [image-streams-grails2.json](https://bitbucket.org/double16/openshift-s2i-grails2/raw/c5874a40a94877513e3c4ab3099f2ef2bee68c0b/image-streams-grails2.json)

Credits
-------

Based on work by https://github.com/anderssv/openshift-sti-java-8

