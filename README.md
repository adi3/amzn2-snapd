# amzn2-snapd

Tools to build and install snapd on Amazon Linux 2 for arm64 machines.

## Install

1. Download packages
    ```
    wget https://github.com/adi3/amzn2-snapd/releases/download/v0.1.0/snap-confine-2.48.2-0.amzn2.aarch64.rpm
    wget https://github.com/adi3/amzn2-snapd/releases/download/v0.1.0/snapd-2.48.2-0.amzn2.aarch64.rpm
    ```

2. Install packages

    ```
    sudo yum install -y snap-confine-2.48.2-0.amzn2.aarch64.rpm snapd-2.48.2-0.amzn2.aarch64.rpm
    ```

3. Enable socket

    ```
    sudo systemctl enable --now snapd.socket
    ```
    
4. Test snapd

    ```
    snap version
    sudo snap install snapcraft --classic
    ```


## Build

1. Set up dependencies
    ```
    sudo yum -y install docker git
    sudo systemctl start docker
    ```

2. Fetch source code

    ```
    git clone https://github.com/adi3/amzn2-snapd
    cd amzn2-snapd
    ```

3. Build RPM packages

    ```
    version=$(curl -s https://api.github.com/repos/snapcore/snapd/releases/latest | grep -oP '"tag_name": "\K(.*)(?=")')
    sudo docker build . --force-rm --build-arg version=$version -t amzn2-snapd:rpm
    ```

4. Fetch packages
    ```
    sudo docker run --rm -v `pwd`:/rpm amzn2-snapd:rpm /bin/bash -l -c "cp -f /root/rpmbuild/RPMS/aarch64/*-$version-0.amzn2.aarch64.rpm /rpm"
    ```

5. Clean up
    ```
    sudo docker rmi amzn2-snapd:rpm
    ```
    
RPM packages will be copied to your current directory. Proceed with installation as explained above.
