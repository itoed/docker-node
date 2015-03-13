FROM itoed/centos
MAINTAINER Eduardo Ito <itoed@yahoo.com>

# NodeSource Repository
RUN curl -sL https://rpm.nodesource.com/setup | bash - ; yum clean all
RUN rpm --import /etc/pki/rpm-gpg/NODESOURCE-GPG-SIGNING-KEY-EL

# Required to build modules for Node.js
RUN yum groupinstall -y 'Development Tools'; yum clean all

# Nodesource nodejs package provides both node and npm
# (The nodejs package from EPEL has problems with inherits@'~2.0.0')
# Package tar is required for `npm install`
RUN yum install -y nodejs tar; yum clean all
