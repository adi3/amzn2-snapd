FROM amazonlinux:latest

ARG version

RUN yum -y update
RUN yum -y install autoconf automake gettext git glib2-devel glibc-static \
  indent libcap-devel libseccomp-devel libtool libudev-devel make patch \
  python-docutils rpm-build valgrind wget xfsprogs-devel golang

RUN git clone https://github.com/snapcore/snapd.git

# Patch borrowed from https://github.com/albuild/snap/blob/master/diff.patch
WORKDIR /snapd
RUN git checkout -b build $snap_version
ADD diff.patch .
RUN patch -p1 < diff.patch

RUN mkdir -p /root/rpmbuild/{SOURCES,SPECS}
WORKDIR /root/rpmbuild

RUN wget -P SOURCES https://github.com/snapcore/snapd/releases/download/$version/snapd_$version.no-vendor.tar.xz
RUN wget -P SOURCES https://github.com/snapcore/snapd/releases/download/$version/snapd_$version.only-vendor.tar.xz

RUN rpmbuild -bb /snapd/packaging/amzn-2/snapd.spec
