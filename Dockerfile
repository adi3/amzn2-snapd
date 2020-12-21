FROM amazonlinux:2.0.20181114

#ARG version
#ARG snap_version

RUN version=$(curl -s https://api.github.com/repos/snapcore/snapd/releases/latest | grep -oP '"tag_name": "\K(.*)(?=")')

RUN yum -y update
RUN yum -y install \
  autoconf \
  automake \
  gettext \
  git \
  glib2-devel \
  glibc-static \
  indent \
  libcap-devel \
  libseccomp-devel \
  libtool \
  libudev-devel \
  make \
#  patch \
#  pkgconfig \
  python-docutils \
  rpm-build \
  valgrind \
  wget \
  xfsprogs-devel \
  golang
#RUN amazon-linux-extras install -y golang1.11

#RUN mkdir /app
#WORKDIR /app
RUN git clone https://github.com/snapcore/snapd.git

#WORKDIR /app/snapd
#RUN git checkout -b build $snap_version
#ADD diff.patch .
#RUN patch -p1 < diff.patch

RUN mkdir -p /root/rpmbuild/{SOURCES,SPECS}
WORKDIR /root/rpmbuild
#RUN wget https://github.com/snapcore/snapd/archive/$snap_version.tar.gz -O SOURCES/snapd-$snap_version.tar.gz
RUN wget -P SOURCES https://github.com/snapcore/snapd/releases/download/$version/snapd_$version.no-vendor.tar.xz
RUN wget -P SOURCES https://github.com/snapcore/snapd/releases/download/$version/snapd_$version.only-vendor.tar.xz
RUN rpmbuild -bb /snapd/packaging/amzn-2/snapd.spec
