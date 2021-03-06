openshift-s2i-grails2 [![CircleCI](https://circleci.com/bb/double16/openshift-s2i-grails2.svg?style=svg&circle-token=b9585f0ebd8f51d40cfef08e931ff0ec76fc0a76)](https://circleci.com/bb/double16/openshift-s2i-grails2)
=====================
[![](https://images.microbadger.com/badges/image/pdouble16/openshift-s2i-grails2.svg)](http://microbadger.com/images/pdouble16/openshift-s2i-grails2 "Get your own image badge on microbadger.com") [![](https://images.microbadger.com/badges/version/pdouble16/openshift-s2i-grails2.svg)](http://microbadger.com/images/pdouble16/openshift-s2i-grails2 "Get your own image badge on microbadger.com") [![](https://images.microbadger.com/badges/commit/pdouble16/openshift-s2i-grails2.svg)](http://microbadger.com/images/pdouble16/openshift-s2i-grails2 "Get your own image badge on microbadger.com") [![](https://images.microbadger.com/badges/version/pdouble16/openshift-s2i-grails2.svg)](http://microbadger.com/images/pdouble16/openshift-s2i-grails2 "Get your own image badge on microbadger.com")

OpenShift S2I builder image for projects using the Grails 2.x framework.

Runs the application in production mode using the embedded web server. Requires use
of the Grails wrapper. This means the particular version of
Grails you want to use will be downloaded on-demand. This builder has
OpenJava 1.8.0 installed on CentOS 7.

This builder supports incremental builds.

Image Stream
------------
The builder can be imported into OpenShift using the file at [image-streams-grails2.json](https://bitbucket.org/double16/openshift-s2i-grails2/raw/9e2cd965dfc451d67470133e85b834f56776fda5/image-streams-grails2.json) using the OpenShift CLI:

```shell
oc login # Use admin credentials
oc create -f image-streams-grails2.json -n openshift
```

Functional Tests
----------------
Firefox, Google Chrome and PhantomJS are available for testing. See https://bitbucket.org/double16/openshift-s2i-browser-base for details.

Pre-Installed Wrappers
----------------------
Wrappers for the following versions of Grails are included in the image:
- 2.5.5
- 2.4.5
- 2.3.11

Credits
-------
Based on work by https://github.com/anderssv/openshift-sti-java-8

